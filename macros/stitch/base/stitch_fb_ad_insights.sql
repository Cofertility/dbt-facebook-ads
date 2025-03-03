{% macro stitch_fb_ad_insights() %}

    {{ adapter.dispatch('stitch_fb_ad_insights', 'facebook_ads')() }}

{% endmacro %}


{% macro default__stitch_fb_ad_insights() %}

select

    CAST(date_start as DATE) as date_day,
    nullif(account_id,'') as account_id,
    nullif(account_name,'') as account_name,
    nullif(ad_id,'') as ad_id,
    nullif(adset_id,'') as adset_id,
    nullif(campaign_id,'') as campaign_id,
    impressions,
    clicks,
    unique_clicks,
    spend,
    frequency,
    reach,
    nullif(objective,'') as objective,
    inline_link_clicks,
    inline_post_engagement,
    unique_inline_link_clicks

from {{ var('ads_insights_table') }}


{% endmacro %}
