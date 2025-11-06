#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents a stream of results returned from operations such as a WS-Management protocol WS-Enumeration:Enumerate operation.
 * @remarks
 * 
  * The corresponding scripting object is <a href="https://docs.microsoft.com/windows/desktop/WinRM/enumerator">Enumerator</a>.
  * 
  * To limit the number of items that are read, set the <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/nf-wsmandisp-iwsmansession-get_batchitems">IWSManSession::BatchItems</a> property.
  * 
  * Be aware that freeing the enumeration object clears pending enumeration requests.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nn-wsmandisp-iwsmanenumerator
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class IWSManEnumerator extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSManEnumerator
     * @type {Guid}
     */
    static IID => Guid("{f3457ca9-abb9-4fa5-b850-90e8ca300e7f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReadItem", "get_AtEndOfStream", "get_Error"]

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanenumerator-readitem
     */
    ReadItem() {
        resource := BSTR()
        result := ComCall(7, this, "ptr", resource, "HRESULT")
        return resource
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanenumerator-get_atendofstream
     */
    get_AtEndOfStream() {
        result := ComCall(8, this, "short*", &eos := 0, "HRESULT")
        return eos
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanenumerator-get_error
     */
    get_Error() {
        value := BSTR()
        result := ComCall(9, this, "ptr", value, "HRESULT")
        return value
    }
}
