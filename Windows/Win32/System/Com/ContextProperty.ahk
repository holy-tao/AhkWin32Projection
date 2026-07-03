#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct ContextProperty {
    #StructPack 8

    policyId : Guid

    flags : UInt32

    pUnk : IUnknown

}
