#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IStreamBufferMediaSeeking.ahk

/**
 * The IStreamBufferMediaSeeking2 interface is exposed by the Stream Buffer Source filter. It provides a method to control the frame rate during fast-forward play (&#0034;trick mode&#0034;).
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferMediaSeeking2)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-istreambuffermediaseeking2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IStreamBufferMediaSeeking2 extends IStreamBufferMediaSeeking{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamBufferMediaSeeking2
     * @type {Guid}
     */
    static IID => Guid("{3a439ab0-155f-470a-86a6-9ea54afd6eaf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetRateEx"]

    /**
     * 
     * @param {Float} dRate 
     * @param {Integer} dwFramesPerSec 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambuffermediaseeking2-setrateex
     */
    SetRateEx(dRate, dwFramesPerSec) {
        result := ComCall(20, this, "double", dRate, "uint", dwFramesPerSec, "HRESULT")
        return result
    }
}
