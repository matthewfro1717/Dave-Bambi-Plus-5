-- Create the 3D backgrounds ahead of time.
function onCreate()
    -- Night time effect from the original mod
    makeLuaSprite('night', '', 0, 0);
    makeGraphic('night', 1280, 720, '000000');
    setScrollFactor('night', 0, 0);
    setProperty('night.scale.x', 2);
    setProperty('night.scale.y', 2);
    setProperty('night.alpha', 0.4);
    setObjectCamera('night', 'game');
    addLuaSprite('night', true);
    
    -- Blue 3D Background
    makeAnimatedLuaSprite('blue3d', 'backgrounds/blue3d', -275, -200);
    addAnimationByPrefix('blue3d', 'bganimationloop', 'blue3d', 24, true);
    playAnim('blue3d', 'bganimationloop', true, false, 0);
    setScrollFactor('blue3d', 0, 0);
    scaleObject('blue3d', 1.5, 1.5);

    -- Red 3D Background
    makeAnimatedLuaSprite('redbg', 'backgrounds/redbg', -275, -200);
    addAnimationByPrefix('redbg', 'bganimationloop', 'redbg', 24, true);
    playAnim('redbg', 'bganimationloop', true, false, 0);
    setScrollFactor('redbg', 0, 0);
    scaleObject('redbg', 1.5, 1.5);
end

-- Add and delete the 3D backgrounds
function onUpdate(elapsed)
    -- Blue one
    if curStep == 384 or curStep == 895 or curStep == 1412 then
        addLuaSprite('blue3d', false);
        removeLuaSprite('night', false);
    elseif curStep == 639 or curStep == 1152 or curStep == 1919 then
        removeLuaSprite('blue3d', false);
        addLuaSprite('night', true);
    end
    -- Red one
    if curStep == 1152 then
        addLuaSprite('redbg', false);
        triggerEvent('Change Scroll Speed', 0.625, 1);
        removeLuaSprite('night', false);
    end
    if curStep == 1412 then
        removeLuaSprite('redbg', true);
        triggerEvent('Change Scroll Speed', 1, 0);
    end

end