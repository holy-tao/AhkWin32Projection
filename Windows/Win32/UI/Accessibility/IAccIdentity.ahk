#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that provides a unique identifier for an accessible element.
 * @see https://docs.microsoft.com/windows/win32/api//oleacc/nn-oleacc-iaccidentity
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IAccIdentity extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAccIdentity
     * @type {Guid}
     */
    static IID => Guid("{7852b78d-1cfd-41c1-a615-9c0c85960b5f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIdentityString"]

    /**
     * Retrieves a string of bytes (an identity string) that uniquely identifies an accessible element.
     * @param {Integer} dwIDChild Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Specifies which child of the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> object the caller wants to identify.
     * @param {Pointer<Pointer<Integer>>} ppIDString Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a>**</b>
     * 
     * Address of a variable that receives a pointer to a callee-allocated identity string. The callee allocates the identity string using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>; the caller must release the identity string by using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> when finished.
     * @param {Pointer<Integer>} pdwIDStringLen Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * Address of a variable that receives the length, in bytes, of the callee-allocated identity string.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Return S_OK, except under exceptional error conditions, such as low memory. If not supported, calling <a href="/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on <a href="/windows/desktop/api/oleacc/nn-oleacc-iaccidentity">IAccIdentity</a> should fail.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccidentity-getidentitystring
     */
    GetIdentityString(dwIDChild, ppIDString, pdwIDStringLen) {
        ppIDStringMarshal := ppIDString is VarRef ? "ptr*" : "ptr"
        pdwIDStringLenMarshal := pdwIDStringLen is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", dwIDChild, ppIDStringMarshal, ppIDString, pdwIDStringLenMarshal, pdwIDStringLen, "HRESULT")
        return result
    }
}
