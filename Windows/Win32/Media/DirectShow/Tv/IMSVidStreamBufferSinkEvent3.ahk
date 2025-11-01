#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidStreamBufferSinkEvent2.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidStreamBufferSinkEvent3)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidstreambuffersinkevent3
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidStreamBufferSinkEvent3 extends IMSVidStreamBufferSinkEvent2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidStreamBufferSinkEvent3
     * @type {Guid}
     */
    static IID => Guid("{735ad8d5-c259-48e9-81e7-d27953665b23}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LicenseChange"]

    /**
     * 
     * @param {Integer} dwProt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersinkevent3-licensechange
     */
    LicenseChange(dwProt) {
        result := ComCall(13, this, "int", dwProt, "HRESULT")
        return result
    }
}
