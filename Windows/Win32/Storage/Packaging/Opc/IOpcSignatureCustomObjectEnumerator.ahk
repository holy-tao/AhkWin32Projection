#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IOpcSignatureCustomObject.ahk
#Include .\IOpcSignatureCustomObjectEnumerator.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * A read-only enumerator of IOpcSignatureCustomObject interface pointers.
 * @remarks
 * 
  * When an enumerator is created, the current position precedes the first pointer of the enumerator. To set the current position to the first pointer, call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturecustomobjectenumerator-movenext">MoveNext</a>method after creating the enumerator.
  * 
  * Changes to the set will invalidate the enumerator, and all subsequent calls to it will fail.
  * 
  * To get an <b>IOpcSignatureCustomObjectEnumerator</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignature-getcustomobjectenumerator">IOpcDigitalSignature::GetCustomObjectEnumerator</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturecustomobjectset-getenumerator">IOpcSignatureCustomObjectSet::GetEnumerator</a> method.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/nn-msopc-iopcsignaturecustomobjectenumerator
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class IOpcSignatureCustomObjectEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpcSignatureCustomObjectEnumerator
     * @type {Guid}
     */
    static IID => Guid("{5ee4fe1d-e1b0-4683-8079-7ea0fcf80b4c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MoveNext", "MovePrevious", "GetCurrent", "Clone"]

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturecustomobjectenumerator-movenext
     */
    MoveNext() {
        result := ComCall(3, this, "int*", &hasNext := 0, "HRESULT")
        return hasNext
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturecustomobjectenumerator-moveprevious
     */
    MovePrevious() {
        result := ComCall(4, this, "int*", &hasPrevious := 0, "HRESULT")
        return hasPrevious
    }

    /**
     * 
     * @returns {IOpcSignatureCustomObject} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturecustomobjectenumerator-getcurrent
     */
    GetCurrent() {
        result := ComCall(5, this, "ptr*", &customObject := 0, "HRESULT")
        return IOpcSignatureCustomObject(customObject)
    }

    /**
     * 
     * @returns {IOpcSignatureCustomObjectEnumerator} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturecustomobjectenumerator-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &copy := 0, "HRESULT")
        return IOpcSignatureCustomObjectEnumerator(copy)
    }
}
