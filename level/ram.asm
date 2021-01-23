
; ----------------------------------------------------------------------------- ;
;										;
;	Disassembly of R11A from Sonic CD					;
;										;
;	Created by Ralakimus							;
;	Special thanks to flamewing and TheStoneBanana for extensive help	;
;										;
;	File 		level/ram.asm						;
;	Contents 	Level RAM						;
;										;
; ----------------------------------------------------------------------------- ;

; -------------------------------------------------------------------------------
; Object structure
; -------------------------------------------------------------------------------

	rsreset

oID				rs.b	1		; ID

oRender				rs.b	1		; Render flags
oTile				rs.w	1		; Base tile ID
oMap				rs.l	1		; Sprite mappings pointer

oX				rs.w	1		; X position
oYScr				rs.b	0		; Y position (screen mode)
oXSub				rs.w	1		; X position subpixel
oY				rs.l	1		; Y position

oXVel				rs.w	1		; X velocity
oYVel				rs.w	1		; Y velocity

oVar14				rs.b	1		; Object specific flags
oVar15				rs.b	1

oYRadius			rs.b	1		; Y radius
oXRadius			rs.b	1		; X radius
oPriority			rs.b	1		; Sprite draw priority level
oWidth				rs.b	1		; Width

oMapFrame			rs.b	1		; Sprite mapping frame ID
oAnimFrame			rs.b	1		; Animation script frame ID
oAnim				rs.b	1		; Animation ID
oPrevAnim			rs.b	1		; Previous previous animation ID
oAnimTime			rs.b	1		; Animation timer

oVar1F				rs.b	1		; Object specific flag

oVar20				rs.b	0		; Object specific flag
oColType			rs.b	1		; Collision type
oVar21				rs.b	0		; Object specific flag
oColStatus			rs.b	1		; Collision status

oStatus				rs.b	1		; Status flags
oRespawn			rs.b	1		; Respawn table entry ID
oRoutine			rs.b	1		; Routine ID
oVar25				rs.b	0		; Object specific flag
oRoutine2			rs.b	1		; Secondary routine ID
oAngle				rs.b	1		; Angle

oVar27				rs.b	1		; Object specific flag

oSubtype			rs.b	1		; Subtype ID
oSubtype2			rs.b	1		; Secondary subtype ID

oVar2A				rs.b	1		; Object specific flags
oVar2B				rs.b	1
oVar2C				rs.b	1
oVar2D				rs.b	1
oVar2E				rs.b	1
oVar2F				rs.b	1
oVar30				rs.b	1
oVar31				rs.b	1
oVar32				rs.b	1
oVar33				rs.b	1
oVar34				rs.b	1
oVar35				rs.b	1
oVar36				rs.b	1
oVar37				rs.b	1
oVar38				rs.b	1
oVar39				rs.b	1
oVar3A				rs.b	1
oVar3B				rs.b	1
oVar3C				rs.b	1
oVar3D				rs.b	1
oVar3E				rs.b	1
oVar3F				rs.b	1

oVarLen				rs.b	0		; Length of object structure

; -------------------------------------------------------------------------------
; Player object variables
; -------------------------------------------------------------------------------

oPlayerGVel			EQU	oVar14		; Ground velocity
oPlayerCharge			EQU	oVar2A		; Peelout/spindash charge timer

oPlayerCtrl			EQU	oVar2C		; Control flags
oPlayerJump			EQU	oVar3C		; Jump flag
oPlayerMoveLock			EQU	oVar3E		; Movement lock timer

oPlayerPriAngle			EQU	oVar36		; Primary angle
oPlayerSecAngle			EQU	oVar37		; Secondary angle
oPlayerStick			EQU	oVar38		; Collision stick flag

oPlayerHurt			EQU	oVar30		; Hurt timer
oPlayerInvinc			EQU	oVar32		; Invincibility timer
oPlayerSpeed			EQU	oVar34		; Speed shoes timer
oPlayerReset			EQU	oVar3A		; Reset timer

oPlayerRotAngle			EQU	oVar2B		; Platform rotation angle
oPlayerRotDist			EQU	oVar39		; Platform rotation distance

oPlayerPushObj			EQU	oVar20		; ID of object being pushed on
oPlayerStandObj			EQU	oVar3D		; ID of object being stood on

; -------------------------------------------------------------------------------
; RAM
; -------------------------------------------------------------------------------

	rsset	RAM_START+$F00

v_ipx_flags			rs.b	1
v_time_attack_mode		rs.b	1
v_saved_zone			rs.w	1
				rs.b	$C
v_time_attack_time		rs.l	1
v_time_attack_level		rs.w	1
v_ipx_vdp_reg1			rs.w	1
v_time_attack_last_lvl		rs.b	1
v_unk_buram_var			rs.b	1
v_good_futures_got		rs.b	1
				rs.b	1
v_demo_id			rs.b	1
v_title_menu_flags		rs.b	1
				rs.b	1
v_buram_init			rs.b	1
v_got_time_stones		rs.b	1
v_cur_spec_stage		rs.b	1
v_pal_clear_flags		rs.b	1
v_unk_ending_flag		rs.b	1
v_ending_id			rs.b	1
v_spec_stage_beat		rs.b	1
				rs.b	$DA
v_unk_buffer 			rs.b	$200
v_obj_respawns 			rs.b	$2FE
				rs.l	1
v_level_restart			rs.w	1
v_frame_timer 			rs.w	1
v_zone 				rs.b	1
v_act 				rs.b	1
v_life_count 			rs.b	1
v_use_player2 			rs.b	1
v_air_left 			rs.w	1
v_time_over 			rs.b	1
v_1up_flags 			rs.b	1
v_update_lives 			rs.b	1
v_update_rings 			rs.b	1
v_update_time 			rs.b	1
v_update_score 			rs.b	1
v_ring_count 			rs.w	1
v_time 				rs.l	1
v_score 			rs.l	1
v_load_plc_flags		rs.b	1
v_pal_fade_flags		rs.b	1
v_shield 			rs.b	1
v_invincible 			rs.b	1
v_speed_shoes 			rs.b	1
v_time_warp_on 			rs.b	1
v_reset_lvl_flags		rs.b	1
v_saved_reset_lvl_flags		rs.b	1
v_saved_x 			rs.w	1
v_saved_y 			rs.w	1
v_travel_ring_count		rs.w	1
v_saved_time 			rs.l	1
v_time_zone 			rs.b	1
				rs.b	1
v_saved_btm_bound		rs.w	1
v_saved_cam_fg_x		rs.w	1
v_saved_cam_fg_y		rs.w	1
v_saved_cam_bg_x		rs.w	1
v_saved_cam_bg_y		rs.w	1
v_saved_cam_bg2_x		rs.w	1
v_saved_cam_bg2_y		rs.w	1
v_saved_cam_bg3_x		rs.w	1
v_saved_cam_bg3_y		rs.w	1
v_saved_water_height2		rs.b	1
v_saved_water_rout		rs.b	1
v_saved_water_full		rs.b	1
v_travel_1up_flags		rs.b	1
v_travel_reset_lvl_flags	rs.b	1
				rs.b	1
v_travel_x 			rs.w	1
v_travel_y 			rs.w	1
v_travel_status			rs.b	1
				rs.b	1
v_travel_btm_bound		rs.b	2
v_travel_cam_fg_x		rs.w	1
v_travel_cam_fg_y		rs.w	1
v_travel_cam_bg_x		rs.w	1
v_travel_cam_bg_y		rs.w	1
v_travel_cam_bg2_x		rs.b	2
v_travel_cam_bg2_y		rs.b	2
v_travel_cam_bg3_x		rs.b	2
v_travel_cam_bg3_y		rs.b	2
v_travel_water_height2		rs.w	1
v_travel_water_rout		rs.b	1
v_travel_water_full		rs.b	1
v_travel_gvel 			rs.w	1
v_travel_xvel 			rs.w	1
v_travel_yvel 			rs.w	1
v_good_future 			rs.b	1
v_load_shield_art		rs.b	1
v_unk_flag 			rs.b	1
v_destroyed_projector		rs.b	1
v_entered_big_ring		rs.b	1
v_blue_ring 			rs.b	1
v_travel_time 			rs.l	1
v_last_camera_plc		rs.w	1
				rs.b	1
v_amy_taken			rs.b	1
v_next_score_1up		rs.l	1
v_angle_buffer 			rs.b	1
v_angle_normal_buf		rs.b	1
v_quadrant_normal_buf		rs.b	1
v_floor_dist 			rs.b	1
v_demo_mode 			rs.w	1
				rs.l	1
v_hw_version 			rs.b	1
				rs.b	1
v_debug_mode_enabled		rs.w	1
v_init_flag 			rs.l	1
v_last_checkpoint		rs.b	1
				rs.b	1
v_good_future_flags		rs.b	1
v_saved_mini_sonic		rs.b	1
				rs.b	1
v_travel_mini_sonic		rs.b	1
				rs.b	$6C
v_flower_pos_buffer		rs.b	$300
v_flower_count			rs.b	3
v_enable_display		rs.b	1
v_debug_object 			rs.b	1
				rs.b	1
v_debug_mode 			rs.w	1
				rs.w	1
v_frame_count 			rs.l	1
v_time_stop_timer		rs.w	1
v_logspike_anim_timer		rs.b	1
v_logspike_anim_frame		rs.b	1
v_ring_anim_timer		rs.b	1
v_ring_anim_frame		rs.b	1
v_unk_anim_timer		rs.b	1
v_unk_anim_frame		rs.b	1
v_ring_spill_timer		rs.b	1
v_ring_spill_frame		rs.b	1
v_ring_spill_accum		rs.b	2
				rs.b	$C
v_cam_x_fg_copy			rs.l	1
v_cam_y_fg_copy			rs.l	1
v_cam_x_bg_copy			rs.l	1
v_cam_y_bg_copy			rs.l	1
v_cam_x_bg2_copy		rs.l	1
v_cam_y_bg2_copy		rs.l	1
v_cam_x_bg3_copy		rs.l	1
v_cam_y_bg3_copy		rs.l	1
v_scroll_flags_copy		rs.l	1
				rs.l	1
v_debug_block 			rs.w	1
				rs.l	1
v_debug_subtype2		rs.b	1
				rs.b	1
v_display_low_plane		rs.b	1
v_level_started			rs.b	1
v_boss_music_playing		rs.b	1
				rs.w	1
v_mini_sonic 			rs.b	1
				rs.b	$24
v_dma_buffer 			rs.b	$480
v_layer_speeds 			rs.b	$200
v_level_blocks 			rs.b	$2000
v_unk_buffer2 			rs.b	$1000
				rs.b	$3000

	rsset	RAM_START+$FF008000

				rs.b	$2000
v_lvl_layout 			rs.b	$800
v_deform_buffer			rs.b	$200
v_nem_dec_buffer		rs.b	$200
v_obj_draw_queue		rs.b	$400
				rs.b	$1800
v_sonic_art 			rs.b	$300
v_sonic_record_buf		rs.b	$100
v_hscroll 			rs.b	$400
v_objects			rs.b	0
v_player 			rs.b	$40
v_player2 			rs.b	$40
v_obj_hud_score			rs.b	$40
v_obj_hud_lives			rs.b	$40
v_obj_title_card		rs.b	$40
v_obj_hud_rings			rs.b	$40
v_obj_shield 			rs.b	$40
v_obj_bubbles 			rs.b	$40
v_obj_inv_star1			rs.b	$40
v_obj_inv_star2			rs.b	$40
v_obj_inv_star3			rs.b	$40
v_obj_inv_star4			rs.b	$40
v_obj_timewarp_star1		rs.b	$40
v_obj_timewarp_star2		rs.b	$40
v_obj_timewarp_star3		rs.b	$40
v_obj_timewarp_star4		rs.b	$40
				rs.b	$40
				rs.b	$40
				rs.b	$40
				rs.b	$40
				rs.b	$40
				rs.b	$40
				rs.b	$40
				rs.b	$40
				rs.b	$40
				rs.b	$40
				rs.b	$40
				rs.b	$40
				rs.b	$40
				rs.b	$40
				rs.b	$40
v_obj_hud_time_icon		rs.b	$40
v_dyn_objects 			rs.b	$1800
v_objects_end			rs.b	$A
v_snd_queue_1 			rs.b	1
v_snd_queue_2 			rs.b	1
v_snd_queue_3 			rs.b	1
				rs.b	$5F3
v_game_mode 			rs.b	1
				rs.b	1
v_player_held 			rs.b	1
v_player_pressed		rs.b	1
v_ctrl1_held 			rs.b	1
v_ctrl1_pressed			rs.b	1
v_ctrl2_held 			rs.b	1
v_ctrl2_pressed			rs.b	1
				rs.l	1
v_vdp_reg_1 			rs.w	1
				rs.b	6
v_vint_timer 			rs.w	1
v_vscroll 			rs.l	1
v_hscroll_full 			rs.l	1
				rs.b	6
v_hint_counter 			rs.w	1
v_pal_fade_start		rs.b	1
v_pal_fade_len 			rs.b	1
v_misc_variables		rs.b	0
v_vint_e_count 			rs.b	1
				rs.b	1
v_vint_routine 			rs.b	1
				rs.b	1
v_sprite_count 			rs.b	1
				rs.b	9
v_rng_seed 			rs.l	1
v_paused 			rs.w	1
				rs.l	1
v_dma_cmd_cache			rs.w	1
				rs.l	1
v_water_height 			rs.w	1
v_water_height2			rs.w	1
				rs.b	3
v_water_routine			rs.b	1
v_water_full 			rs.b	1
				rs.b	$17
v_ani_art_frames		rs.b	6
v_ani_art_timers		rs.b	6
				rs.b	$E
v_plc_buffer 			rs.b	$60
v_plc_nem_write 		rs.l	1
v_plc_repeat 			rs.l	1
v_plc_pixel 			rs.l	1
v_plc_row 			rs.l	1
v_plc_read 			rs.l	1
v_plc_shift 			rs.l	1
v_plc_tile_cnt 			rs.w	1
v_plc_proc_tile_cnt 		rs.w	1
v_hint_flag 			rs.w	1
				rs.w	1
v_cam_fg_x 			rs.l	1
v_cam_fg_y 			rs.l	1
v_cam_bg_x 			rs.l	1
v_cam_bg_y 			rs.l	1
v_cam_bg2_x 			rs.l	1
v_cam_bg2_y 			rs.l	1
v_cam_bg3_x 			rs.l	1
v_cam_bg3_y 			rs.l	1
v_dest_left_bound		rs.w	1
v_dest_right_bound		rs.b	2
v_dest_top_bound		rs.w	1
v_dest_btm_bound		rs.w	1
v_left_bound 			rs.w	1
v_right_bound 			rs.w	1
v_top_bound 			rs.w	1
v_bottom_bound 			rs.w	1
v_unused_f730 			rs.w	1
v_left_bound3 			rs.w	1
				rs.b	6
v_scroll_diff_x			rs.w	1
v_scroll_diff_y			rs.w	1
v_cam_y_center 			rs.w	1
v_unused_f740 			rs.b	1
v_unused_f741 			rs.b	1
v_event_routine			rs.w	1
v_scroll_lock 			rs.w	1
v_unused_f746 			rs.w	1
v_unused_f748 			rs.w	1
v_horiz_blk_crossed_flag	rs.b	1
v_verti_blk_crossed_flag	rs.b	1
v_horiz_blk_cross_flag_bg	rs.b	1
v_verti_blk_cross_flag_bg	rs.b	1
v_horiz_blk_cross_flag_bg2	rs.b	2
v_horiz_blk_cross_flag_bg3	rs.b	1
				rs.b	1
				rs.b	1
				rs.b	1
v_scroll_flags 			rs.w	1
v_scroll_flags_bg		rs.w	1
v_scroll_flags_bg2		rs.w	1
v_scroll_flags_bg3		rs.w	1
v_btm_bound_shifting		rs.w	1
				rs.w	1
v_sonic_top_speed		rs.w	1
v_sonic_acceleration		rs.w	1
v_sonic_deceleration		rs.w	1
v_sonic_last_frame		rs.b	1
v_sonic_frame_changed		rs.b	1
v_primary_angle			rs.b	1
				rs.b	1
v_secondary_angle		rs.b	1
				rs.b	1
v_lvl_obj_man_rout		rs.b	1
				rs.b	1
v_obj_prev_cam_x		rs.w	1
v_obj_load_addr_right		rs.l	1
v_obj_load_addr_left		rs.l	1
v_obj_load_addr2_right		rs.l	1
v_obj_load_addr2_left		rs.l	1
v_bored_timer 			rs.w	1
v_p2_bored_timer 		rs.w	1
v_time_warp_dir			rs.b	1
				rs.b	1
v_time_warp_timer		rs.w	1
v_look_mode 			rs.b	1
				rs.b	1
v_demo_data_ptr 		rs.l	1
v_demo_timer 			rs.w	1
v_s1_demo_data_index 		rs.w	1
				rs.l	1
v_collision_ptr			rs.l	1
				rs.b	6
v_cam_x_center 			rs.w	1
				rs.b	5
v_boss_flags			rs.b	1
v_sonic_record_index		rs.w	1
v_boss_fight 			rs.b	1
				rs.b	1
v_loop_chunks 			rs.l	1
v_palcyc_steps 			rs.b	7
v_palcyc_timers			rs.b	7
				rs.b	9
v_wind_tunnel_on		rs.b	1
				rs.b	1
				rs.b	1
v_jump_only 			rs.b	1
				rs.b	1
v_ctrl_locked 			rs.b	1
				rs.b	3
v_chain_bonus_counter		rs.w	1
v_bonus_countdown_1		rs.w	1
v_bonus_countdown_2		rs.w	1
v_update_bonus_score		rs.b	1
				rs.b	3
v_saved_sr 			rs.w	1
				rs.b	$24
v_sprites 			rs.b	$200
v_water_fade_pal		rs.b	$80
v_water_palette			rs.b	$80
v_palette 			rs.b	$80
v_fade_palette 			rs.b	$80

; ----------------------------------------------------------------------------- ;
