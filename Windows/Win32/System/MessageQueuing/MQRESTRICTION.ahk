#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MQPROPERTYRESTRICTION.ahk" { MQPROPERTYRESTRICTION }

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct MQRESTRICTION {
    #StructPack 8

    cRes : UInt32

    paPropRes : MQPROPERTYRESTRICTION.Ptr

}
