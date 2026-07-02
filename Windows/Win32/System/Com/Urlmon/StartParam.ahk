#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\IUnknown.ahk" { IUnknown }
#Import "..\IBindCtx.ahk" { IBindCtx }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct StartParam {
    #StructPack 8

    iid : Guid

    pIBindCtx : IBindCtx

    pItf : IUnknown

}
