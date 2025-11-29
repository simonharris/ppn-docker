<script setup>
import { API_HOST } from '@/config';
</script>

<template>

<div class="row" v-if="project">
    <div class="col-md-4">
        <a :href="project.url" target="_blank">
            <img :src="API_HOST + '/static/thumbs/' + project.thumbnail" class="img-fluid img-thumbnail mb-2">
        </a>
    </div>

    <div class="col-md-8">
        <p class="breadcrumb"><router-link :to="'/'">Projects</router-link>&nbsp;&raquo; {{ project.name }}</p>
        <p v-html="project.description"></p>
        <p v-if="project.url" class="btn-visit">
            <a :href="project.url" class="btn btn-light text-secondary " role="button">Visit Project</a>
        </p>
    </div>
</div>

<div class="row" v-else-if="error">

    <div class="col-md-4">
        <img :src="API_HOST + '/static/thumbs/placeholder.webp'" class="img-fluid img-thumbnail mb-2">
    </div>

    <div class="col-md-8">
        <p class="breadcrumb"><router-link :to="'/'">Projects</router-link>&nbsp;&raquo; Not found</p>
        <p>Project not found.</p>
    </div>
</div>


</template>

<script>

export default {
    data() {
        return {
            project: { name: 'Project Placeholder' },
            isThumbnailExpanded: false,
        };
    },
    props: {
        config: Object,
    },
    computed: {
        // ...
    },
    methods: {
        async fetchDetails(slug) {
            try {
                const response = await fetch(`${API_HOST}/api/detail/${slug}`);
                if (!response.ok) {
                    this.project = null;
                    this.error = response.status === 404 ? 'Project not found' : 'An unexpected error occurred';
                    return;
                }
                const data = await response.json();
                this.project = data.project;
                this.error = null;
                this.$emit('update-config', {
                    title: data.project.name,
                    headline: data.project.headline
                });
            } catch (err) {
                console.error(err);
                this.project = null;
                this.error = 'Network error or API unreachable';
            }
        },
    },
    watch: {
        $route: {
        handler(to, from) {
            if (to.params.slug != undefined) {
                this.fetchDetails(to.params.slug);
            }
        },
        immediate: true
        }
    }
}

</script>

<style scoped>
/* .img-thumbnail {
  cursor: pointer;
} */

</style>