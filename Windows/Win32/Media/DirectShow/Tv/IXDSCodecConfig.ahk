#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005. The IXDSCodecConfig interface configures the XDS Codec filter. Most applications will not have to use this interface.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IXDSCodecConfig)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//encdec/nn-encdec-ixdscodecconfig
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IXDSCodecConfig extends IUnknown{
    /**
     * The interface identifier for IXDSCodecConfig
     * @type {Guid}
     */
    static IID => Guid("{c4c4c4d3-0049-4e2b-98fb-9537f6ce516d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} ppUnkDRMSecureChannel 
     * @returns {HRESULT} 
     */
    GetSecureChannelObject(ppUnkDRMSecureChannel) {
        result := ComCall(3, this, "ptr", ppUnkDRMSecureChannel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwPauseBufferTime 
     * @returns {HRESULT} 
     */
    SetPauseBufferTime(dwPauseBufferTime) {
        result := ComCall(4, this, "uint", dwPauseBufferTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
