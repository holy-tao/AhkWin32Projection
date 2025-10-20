#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IStreamBufferSource interface is exposed by the Stream Buffer Source filter. Use this interface to play live content from the Stream Buffer Sink filter.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferSource)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-istreambuffersource
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IStreamBufferSource extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamBufferSource
     * @type {Guid}
     */
    static IID => Guid("{1c5bd776-6ced-4f44-8164-5eab0e98db12}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetStreamSink"]

    /**
     * 
     * @param {IStreamBufferSink} pIStreamBufferSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambuffersource-setstreamsink
     */
    SetStreamSink(pIStreamBufferSink) {
        result := ComCall(3, this, "ptr", pIStreamBufferSink, "HRESULT")
        return result
    }
}
