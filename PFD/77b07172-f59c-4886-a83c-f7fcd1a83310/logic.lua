---------------------------------------------------------------------------------------------------------------------------------
-- Glass Panel based on the Garmin G1000 PFD for Cessna
-- Panel can be used for other (1 engine) aircrafts, by adjusting the parameters
-- made by Ivan Subotic April 2015
----------------------------------------------------------------------------------------------------------------------------------

-- Parameters -------------------------------------------------------------------------------------------------------------------
call_sign = "N31SL"
n1_max = 100
itt_max = 810
fuelflow_max = 810
n2_max = 100
oilpress_max = 170
oiltemp_max = 128
fuelcapacity = 1698*0.453 -- kg

-- Development -------------------------------------------------------------------------------------------------------------------
deltax = 195
deltay = 56

-- Standard fonts and colors -------------------------------------------------------------------------------------------------------------------
txt_load_font("Consolas.ttf")
font_red_16 = "-fx-font-family:\"Consolas\"; -fx-font-size:16px; -fx-fill: red; -fx-text-alignment: LEFT;"
font_orange_16 = "-fx-font-family:\"Consolas\"; -fx-font-size:16px; -fx-fill: orange; -fx-text-alignment: LEFT;"
font_orange_20 = "-fx-font-family:\"Consolas\"; -fx-font-size:20px; -fx-fill: orange; -fx-text-alignment: CENTER;"
font_gold_16 = "-fx-font-family:\"Consolas\"; -fx-font-size:16px; -fx-fill: gold; -fx-text-alignment: LEFT;"
font_gold_22 = "-fx-font-family:\"Consolas\"; -fx-font-size:22px; -fx-fill: gold; -fx-text-alignment: CENTER;"
font_limegreen_18 = "-fx-font-family:\"Consolas\"; -fx-font-size:18px; -fx-fill: limegreen; -fx-font-weight:bold; -fx-text-alignment: CENTER;"
font_limegreen_20 = "-fx-font-family:\"Consolas\"; -fx-font-size:20px; -fx-fill: limegreen; -fx-font-weight:bold; -fx-text-alignment: CENTER;"
font_fuchsia_20 = "-fx-font-family:\"Consolas\"; -fx-font-size:20px; -fx-fill: fuchsia; -fx-font-weight:bold; -fx-text-alignment: CENTER;"
font_fuchsia_22 = "-fx-font-family:\"Consolas\"; -fx-font-size:22px; -fx-fill: fuchsia; -fx-font-weight:bold; -fx-text-alignment: CENTER;"
font_skyblue_22 = "-fx-font-family:\"Consolas\"; -fx-font-size:22px; -fx-fill: skyblue; -fx-font-weight:bold; -fx-text-alignment: CENTER;"
font_skyblue_20 = "-fx-font-family:\"Consolas\"; -fx-font-size:20px; -fx-fill: skyblue; -fx-font-weight:bold; -fx-text-alignment: CENTER;"
font_skyblue_18 = "-fx-font-family:\"Consolas\"; -fx-font-size:18px; -fx-fill: skyblue; -fx-font-weight:bold; -fx-text-alignment: CENTER;"
font_darkslategrey_16 = "-fx-font-family:\"Consolas\"; -fx-font-size:16px; -fx-fill: darkslategrey; -fx-font-weight:bold; -fx-text-alignment: CENTER;"
--font_white_33 = "-fx-font-family:\"Consolas\"; -fx-font-size:33px; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment: RIGHT;"
--font_white_20 = "-fx-font-family:\"Consolas\"; -fx-font-size:20px; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment: RIGHT;"
--font_white_17 = "-fx-font-family:\"Consolas\"; -fx-font-size:17px; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment: RIGHT;" -- added font for Attitude ind baro display
font_white_16 = "-fx-font-family:\"Consolas\"; -fx-font-size:16px; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment: CENTER;" -- added for OAT display
font_firebrick_20 = "-fx-font-family:\"Consolas\"; -fx-font-size:20px; -fx-fill: firebrick; -fx-text-alignment: CENTER;"

txt_load_font("Inconsolata-Bold.ttf")
txt_load_font("Inconsolata-Regular.ttf")
font_white_33 = "-fx-font-family:\"Inconsolata\"; -fx-font-size:33px; -fx-fill: white; -fx-font-weight:regular; -fx-text-alignment: RIGHT;"
font_white_32 = "-fx-font-family:\"Inconsolata\"; -fx-font-size:32px; -fx-fill: white; -fx-font-weight:regular; -fx-text-alignment: RIGHT;"
font_white_25 = "-fx-font-family:\"Inconsolata\"; -fx-font-size:25px; -fx-fill: white; -fx-font-weight:regular; -fx-text-alignment: RIGHT;"
font_white_22 = "-fx-font-family:\"Inconsolata\"; -fx-font-size:22px; -fx-fill: white; -fx-font-weight:regular; -fx-text-alignment: RIGHT;"
font_white_21 = "-fx-font-family:\"Inconsolata\"; -fx-font-size:21px; -fx-fill: white; -fx-font-weight:regular; -fx-text-alignment: RIGHT;"
font_white_20 = "-fx-font-family:\"Inconsolata\"; -fx-font-size:20px; -fx-fill: white; -fx-font-weight:regular; -fx-text-alignment: RIGHT;"
font_white_19 = "-fx-font-family:\"Inconsolata\"; -fx-font-size:19px; -fx-fill: white; -fx-font-weight:regular; -fx-text-alignment: RIGHT;"
font_white_18 = "-fx-font-family:\"Inconsolata\"; -fx-font-size:18px; -fx-fill: white; -fx-font-weight:regular; -fx-text-alignment: RIGHT;"
font_white_17 = "-fx-font-family:\"Inconsolata\"; -fx-font-size:17px; -fx-fill: white; -fx-font-weight:regular; -fx-text-alignment: RIGHT;"
font_white_16 = "-fx-font-family:\"Inconsolata\"; -fx-font-size:16px; -fx-fill: white; -fx-font-weight:regular; -fx-text-alignment: RIGHT;"
font_white_15 = "-fx-font-family:\"Inconsolata\"; -fx-font-size:15px; -fx-fill: white; -fx-font-weight:regular; -fx-text-alignment: RIGHT;" -- added font for Attitude ind baro display

-- Frame image -------------------------------------------------------------------------------------------------------------------
-- on top of this backdrop place the buttons
--img_add_fullscreen("garmin_panel_backdrop.png")

img_add("garmin_panel_backdrop.png", 0, 0, 1414, 928)

-- Horizon image -------------------------------------------------------------------------------------------------------------------
img_horizon = img_add("garmin_horizon.png", deltax-752, deltay-450, 2048, 1536)
viewport_rect(img_horizon, deltax, deltay, 1024, 768)
img_horizon_scale = img_add("garmin_horizon_scale.png", deltax-565, deltay-483, 2048, 1536)
viewport_rect(img_horizon_scale, 318+deltax, 127+deltay, 280, 268)

-- Glass panel backdrop -------------------------------------------------------------------------------------------------------------------
img_add("garmin_pfd_backdrop.png",deltax, deltay, 1024, 768)

-- Turn/Slip Indicators -------------------------------------------------------------------------------------------------------------------
img_roll_indicator = img_add("garmin_roll_indicator.png", deltax, deltay, 1024, 768)
img_slip_indicator = img_add("garmin_slip_indicator.png", deltax, deltay, 1024, 768)

-- Speed tape -------------------------------------------------------------------------------------------------------------------
function item_value_callback_speed(i)
    return string.format("%d", 0 - (i * 10) )
end

running_text_speed = running_txt_add_ver(143+deltax, 97+deltay, 7, 68, 57, item_value_callback_speed, font_white_25)
running_img_speed  = running_img_add_ver("garmin_speedtapeimage.png", 217+deltax, 113+deltay, 7, 20, 57)

running_img_move_carot(running_img_speed, 0)
running_txt_move_carot(running_text_speed, 0)

-- Altitude tape -------------------------------------------------------------------------------------------------------------------
function item_value_callback_alt(i)
	return string.format("%d", i * 100 * -1 )
end

running_text_alt = running_txt_add_ver(718+deltax, 100+deltay, 7, 80, 57, item_value_callback_alt, font_white_25)
running_img_alt  = running_img_add_ver("garmin_alttapeimage.png", 705+deltax, 114+deltay, 6, 16, 57)

running_img_move_carot(running_img_alt, 0)
running_txt_move_carot(running_text_alt, 0)

-- Speed amd alt boxes -------------------------------------------------------------------------------------------------------------------
img_add("garmin_speedbox.png",157+deltax, 250+deltay, 79, 69)
img_add("garmin_altbox.png",705+deltax, 252+deltay, 98, 66)


--txt_add(call_sign, font_orange_20, 878+deltax, 349-144+deltay, 200, 60)
--FD_bars = img_add ( "fd_bars.png" , 545 , 342 , 219 , 33 )

-- Running text airspeed -------------------------------------------------------------------------------------------------------------------
function item_value_callback_inner_speed_minor(i)
    
	if i > 0 then
		return""
	else
		return string.format("%d", (0 - i) % 10 )
	end
	
end

running_text_inner_speed_minor_id = running_txt_add_ver(193+deltax, 237+deltay, 3, 30, 30, item_value_callback_inner_speed_minor, font_white_32)
running_txt_move_carot(running_text_inner_speed_minor_id, 0)
running_txt_viewport_rect(running_text_inner_speed_minor_id, 193+deltax, 251+deltay, 30, 65)

function item_value_callback_inner_speed_major(i)
    
	if i == 0 then
		return ""
	else
		return string.format("%d", (0 - i) )
	end
	
end

running_text_inner_speed_major_id = running_txt_add_ver(153+deltax, 237+deltay, 3, 52, 30, item_value_callback_inner_speed_major, font_white_32)
running_txt_move_carot(running_text_inner_speed_major_id, 0)
running_txt_viewport_rect(running_text_inner_speed_major_id, 153+deltax, 265+deltay, 52, 35)

txt_add("TAS", font_white_18, 152+deltax, 460+deltay, 30, 40)
txt_tas = txt_add("000", font_white_25, 182+deltax, 456+deltay, 40, 40)
txt_add("KT", font_white_15, 208+deltax, 465+deltay, 30, 40)

-- Running text altitude -------------------------------------------------------------------------------------------------------------------
function item_value_callback_inner_alt_minor(i)
	
	if i == 0 then
		return"0"
	elseif i > 0 then
  	return""
	else
		return string.format("%02d", ((0-i)%10) * 10 )
	end
	
end

running_text_inner_alt_minor_id = running_txt_add_ver(769+deltax,240+deltay, 3, 30, 30, item_value_callback_inner_alt_minor, font_white_25)
running_txt_move_carot(running_text_inner_alt_minor_id, 0)
running_txt_viewport_rect(running_text_inner_alt_minor_id, 773+deltax, 252+deltay, 30, 66)


function item_value_callback_inner_alt_major100(i)
    
	if i == 0 then
		return""
	else
		return string.format("%d", (0 - i)%10 )
	end
	
end

running_text_inner_alt_major100_id = running_txt_add_ver(757+deltax, 240+deltay, 3, 15, 30, item_value_callback_inner_alt_major100, font_white_25)
running_txt_move_carot(running_text_inner_alt_major100_id, 0)
running_txt_viewport_rect(running_text_inner_alt_major100_id, 757+deltax, 265+deltay, 20, 40)

function item_value_callback_inner_alt_major1000(i)

	if i == 0 then
		return""
	else
		return"" .. - i
	end
	
end

running_text_inner_alt_major1000_id = running_txt_add_ver(724+deltax, 231+deltay, 3, 35, 35, item_value_callback_inner_alt_major1000, font_white_33)
running_txt_move_carot(running_text_inner_alt_major1000_id, 0)
running_txt_viewport_rect(running_text_inner_alt_major1000_id, 724+deltax, 265+deltay, 35, 40)


-- HSI parts -------------------------------------------------------------------------------------------------------------------
img_compasrose = img_add("garmin_compassrose.png", 317+deltax, 444+deltay, 285, 285)

--[[
img_hsi_rose = img_add("eclipse_compass.png",256-160+deltax,576-160+deltay,320,320)
img_adf1_needle = img_add("eclipse_adf1.png",256-160+deltax,576-160+deltay,320,320)
img_adf2_needle = img_add("eclipse_adf2.png",256-160+deltax,576-160+deltay,320,320)
img_hsi_needle = img_add("eclipse_hsi_needle.png",256-160+deltax,576-160+deltay,320,320)
img_middle_needle = img_add("eclipse_hsi_middle_needle.png",0+deltax,0+deltay,5,106)
img_heading_bug1 = img_add("eclipse_hdg_bug1.png",446,466,37,334)
txt_crs = txt_add("000", font_gold_22, 0+deltax, 406+deltay, 100, 60)
txt_hdg = txt_add("000", font_fuchsia_22, 412+deltax, 406+deltay, 100, 60)
txt_nav_mode = txt_add("NAV1", font_limegreen_20, 880+deltax, 349-120+deltay, 200, 60) 
img_wind_rose_arrow = img_add("wind_rose_arrow.png",30+deltax,460+deltay,50,50)
txt_wind_speed = txt_add("0", font_limegreen_18, 5+deltax,510+deltay-65, 100, 60)
--]]

function IBS_attitude(roll, pitch, verticalspeed, slip, vs_tgt, rad_alt)    -- add target bug on 
-- Attitude get data -------------------------------------------------------------------------------------------------------------

--vs_status= vs_tgt
    
		radial = math.rad(roll * -1)
		
		-- horizon
		img_rotate(img_horizon  , roll * -1)
    pitch = var_cap(pitch,-60,60)
    x = -(math.sin(radial) * pitch * 7.2)
    y = (math.cos(radial) * pitch * 7.2)
    move(img_horizon, x+deltax-567, y+deltay-483, nil, nil)
    
		-- horizon scale
		move(img_horizon_scale, x+deltax-565, y+deltay-483, nil, nil)
		img_rotate(img_horizon_scale  , roll * -1)

		
		-- roll indicator scale
		-- center of rotation needs to be moved: from (512, 384) to (459, 284)
		-- x2 = cos(roll) * (x1 - x0) - sin(roll) * (y1 - y0) + x0
		-- y2 = sin(roll) * (x1 - x0) + cos(roll) * (y1 - y0) + y0
		x2 = math.cos(radial) * (512 - 459) - math.sin(radial) * (384 - 284) + 459
		y2 = math.sin(radial) * (512 - 459) + math.cos(radial) * (384 - 284) + 284		
		move(img_roll_indicator, x2 + deltax - 512, y2 + deltay - 384, nil, nil)
		img_rotate(img_roll_indicator  , roll * -1)
		
		-- vertical speed
    if verticalspeed > 5200 then verticalspeed = 4200 end
    if verticalspeed < -5200 then verticalspeed = -4200 end
      if vs_tgt > 5000 then vs_tgt = 5000 end
    if vs_tgt < -5000 then vs_tgt = -5000 end
    if math.abs(verticalspeed) <= 1000  then
    move(img_vertical_speed_indicator, nil, 189+deltay- 1- verticalspeed *38/1000, nil, nil)
    elseif verticalspeed > 1000 then
     move(img_vertical_speed_indicator, nil, 189+deltay- 1 - 38-(verticalspeed-1000)*75/4000, nil, nil)
     else	
        move(img_vertical_speed_indicator, nil, 189+deltay- 1 + 38 -(verticalspeed+1000)*75/4000, nil, nil)
    end
    if math.abs(vs_tgt) <= 1000  then
    move(img_vertical_speed_target, nil, 189+deltay-4 - vs_tgt *38/1000, nil, nil)
    elseif vs_tgt > 1000 then
     move(img_vertical_speed_target, nil, 189+deltay- 4  - 38-(vs_tgt-1000)*75/4000, nil, nil)
     else	
        move(img_vertical_speed_target, nil, 189+deltay- 4 + 38 -(vs_tgt+1000)*75/4000, nil, nil)
    end
    if verticalspeed == 0 then verticalspeed=0.0001 end
     txt_set(txt_vs_act, verticalspeed/ math.abs(verticalspeed) * math.floor(math.abs(verticalspeed/100) )*100 )
    
     visible( txt_ra, rad_alt <= 2500 and rad_alt > 0)
    
     txt_set(txt_ra,string.format("RA %0d",(math.floor(rad_alt/10)*10)))
		 
		 
		 -- slip (+/- 8 degrees)
		 slip = var_cap(slip, -8, 8)
		 slip_rate = slip / 8
		 move(img_slip_indicator, (slip_rate*20) + deltax, nil, nil, nil)
end

function IBS_airspeed(airspeed,ias)
-- Airspeed get data -------------------------------------------------------------------------------------------------------------------
		
		airspeed = var_cap(airspeed, 0, 999)
		
		-- Speed indicator running image (speed tape)
		running_txt_move_carot(running_text_speed, (airspeed / 10) * -1)
		running_img_move_carot(running_img_speed, (airspeed / 10) * -1)
	
		yspeed = 171 + (airspeed * 6.6)
		yspeed = var_cap(yspeed, 170, 342)
	
		running_txt_viewport_rect(running_text_speed, 143+deltax, 113+deltay, 95, yspeed)
		running_img_viewport_rect(running_img_speed, 217+deltax, 113+deltay, 20, yspeed)
		
		-- Speed indicator running text
		running_txt_move_carot(running_text_inner_speed_minor_id, (airspeed / 1) * -1)

		if airspeed % 10 > 9 then
			running_txt_move_carot(running_text_inner_speed_major_id, ( airspeed - 9 - (math.floor(airspeed / 10) * 9) ) * -1 )
		else
			running_txt_move_carot(running_text_inner_speed_major_id, math.floor(airspeed / 10) * -1)
		end
		
    --txt_set(txt_ias,  var_round(airspeed,0) )
		txt_set(txt_tas,  var_round(airspeed,0) )
end


function IBS_altitude(altitude)
-- Altitude get data -------------------------------------------------------------------------------------------------------------------
	
	-- Altitude indicator running image
	altitude = var_cap(altitude, 0, 40000)

	running_txt_move_carot(running_text_alt, (altitude / 100) * -1)
	running_img_move_carot(running_img_alt, (altitude / 100) * -1)
	
	yalt = 171 + (altitude * 1.16)
	yalt = var_cap(yalt, 171, 342)
	
	running_txt_viewport_rect(running_text_alt, 661+deltax, 113+deltay, 137, yalt)
	running_img_viewport_rect(running_img_alt, 661+deltax, 113+deltay, 137, yalt)
	
	-- Altitude indicator running text
	running_txt_move_carot(running_text_inner_alt_minor_id, (altitude / 10) * -1)
	
	if altitude % 100 > 90 then
		running_txt_move_carot(running_text_inner_alt_major100_id, ( altitude - 90 - (math.floor(altitude / 100) * 90) ) * -0.1 )
	else
		running_txt_move_carot(running_text_inner_alt_major100_id, math.floor(altitude / 100) * -1)
	end
	
	if (altitude % 1000) > 990 then
		running_txt_move_carot(running_text_inner_alt_major1000_id, (( altitude - 990 - (math.floor(altitude / 1000) * 990) ) * -0.1))
	else
		running_txt_move_carot(running_text_inner_alt_major1000_id, math.floor( altitude / 1000 ) * -1)
	end
	
end










 
-- Data subscribtions --

xpl_dataref_subscribe("sim/flightmodel/position/phi", "FLOAT",
                        "sim/flightmodel/position/theta", "FLOAT",
                        "sim/flightmodel/position/vh_ind_fpm", "FLOAT",
												"sim/cockpit2/gauges/indicators/slip_deg", "FLOAT",
                        "sim/cockpit2/autopilot/vvi_dial_fpm", "FLOAT",
                        "sim/cockpit2/gauges/indicators/radio_altimeter_height_ft_pilot","FLOAT", IBS_attitude)-- actual vvi tgt vvi sim/cockpit2/gauges/indicators/vvi_fpm_pilot
-- Attitude get data -----------------------------------------------------------------------------------------------------------------
												
-- Speed get data --------------------------------------------------------------------------------------------------------------------
xpl_dataref_subscribe("sim/cockpit2/gauges/indicators/airspeed_kts_pilot", "FLOAT",
												                        "sim/cockpit/autopilot/airspeed", "FLOAT", IBS_airspeed)

xpl_dataref_subscribe("sim/cockpit2/gauges/indicators/radio_altimeter_height_ft_pilot","FLOAT", IBS_altitude)-- Altitude get data -----------------------------------------------------------------------------------------------------------------
