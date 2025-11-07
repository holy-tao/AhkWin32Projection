#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IOpcSignatureReference.ahk
#Include .\IOpcSignatureReferenceEnumerator.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * A read-only enumerator of IOpcSignatureReference interface pointers.
 * @remarks
 * 
  * When an enumerator is created, the current position precedes the first pointer. To set the current position to the first pointer of the enumerator, call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturereferenceenumerator-movenext">MoveNext</a>method after creating the enumerator.
  * 
  * Changes to the set will invalidate the enumerator, and all subsequent calls to it will fail.
  * 
  * To get an <b>IOpcSignatureReferenceEnumerator</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturereferenceset-getenumerator">IOpcSignatureReferenceSet::GetEnumerator</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignature-getcustomreferenceenumerator">IOpcDigitalSignature::GetCustomReferenceEnumerator</a> method.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/nn-msopc-iopcsignaturereferenceenumerator
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class IOpcSignatureReferenceEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpcSignatureReferenceEnumerator
     * @type {Guid}
     */
    static IID => Guid("{cfa59a45-28b1-4868-969e-fa8097fdc12a}")

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
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturereferenceenumerator-movenext
     */
    MoveNext() {
        result := ComCall(3, this, "int*", &hasNext := 0, "HRESULT")
        return hasNext
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturereferenceenumerator-moveprevious
     */
    MovePrevious() {
        result := ComCall(4, this, "int*", &hasPrevious := 0, "HRESULT")
        return hasPrevious
    }

    /**
     * 
     * @returns {IOpcSignatureReference} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturereferenceenumerator-getcurrent
     */
    GetCurrent() {
        result := ComCall(5, this, "ptr*", &reference := 0, "HRESULT")
        return IOpcSignatureReference(reference)
    }

    /**
     * 
     * @returns {IOpcSignatureReferenceEnumerator} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturereferenceenumerator-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &copy := 0, "HRESULT")
        return IOpcSignatureReferenceEnumerator(copy)
    }
}
