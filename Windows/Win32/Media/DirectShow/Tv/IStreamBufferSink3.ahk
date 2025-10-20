#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IStreamBufferSink2.ahk

/**
 * The IStreamBufferSink3 interface is exposed by the Stream Buffer Sink filter.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferSink3)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-istreambuffersink3
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IStreamBufferSink3 extends IStreamBufferSink2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamBufferSink3
     * @type {Guid}
     */
    static IID => Guid("{974723f2-887a-4452-9366-2cff3057bc8f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAvailableFilter"]

    /**
     * 
     * @param {Pointer<Integer>} prtMin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambuffersink3-setavailablefilter
     */
    SetAvailableFilter(prtMin) {
        result := ComCall(7, this, "int64*", prtMin, "HRESULT")
        return result
    }
}
