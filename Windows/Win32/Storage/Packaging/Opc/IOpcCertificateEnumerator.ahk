#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IOpcCertificateEnumerator.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * A read-only enumerator of pointers to CERT_CONTEXT structures.
 * @remarks
 * 
 * When an enumerator is created, the current position precedes the first pointer of the enumerator. To set the current position to the first pointer, call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopccertificateenumerator-movenext">MoveNext</a>method after the enumerator is created.
 * 
 * Changes to the set will invalidate the enumerator and all subsequent calls to it will fail.
 * 
 * To get an <b>IOpcCertificateEnumerator</b> interface pointer, call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopccertificateset-getenumerator">IOpcCertificateSet::GetEnumerator</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignature-getcertificateenumerator">IOpcDigitalSignature::GetCertificateEnumerator</a> method.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/nn-msopc-iopccertificateenumerator
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class IOpcCertificateEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpcCertificateEnumerator
     * @type {Guid}
     */
    static IID => Guid("{85131937-8f24-421f-b439-59ab24d140b8}")

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
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopccertificateenumerator-movenext
     */
    MoveNext() {
        result := ComCall(3, this, "int*", &hasNext := 0, "HRESULT")
        return hasNext
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopccertificateenumerator-moveprevious
     */
    MovePrevious() {
        result := ComCall(4, this, "int*", &hasPrevious := 0, "HRESULT")
        return hasPrevious
    }

    /**
     * 
     * @returns {Pointer<CERT_CONTEXT>} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopccertificateenumerator-getcurrent
     */
    GetCurrent() {
        result := ComCall(5, this, "ptr*", &certificate := 0, "HRESULT")
        return certificate
    }

    /**
     * 
     * @returns {IOpcCertificateEnumerator} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopccertificateenumerator-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &copy := 0, "HRESULT")
        return IOpcCertificateEnumerator(copy)
    }
}
