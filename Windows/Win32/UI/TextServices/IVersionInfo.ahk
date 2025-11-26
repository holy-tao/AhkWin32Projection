#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that supply version information for accessible elements.
 * @see https://docs.microsoft.com/windows/win32/api//msaatext/nn-msaatext-iversioninfo
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IVersionInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVersionInfo
     * @type {Guid}
     */
    static IID => Guid("{401518ec-db00-4611-9b29-2a0e4b9afa85}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSubcomponentCount", "GetImplementationID", "GetBuildVersion", "GetComponentDescription", "GetInstanceDescription"]

    /**
     * Clients call IVersionInfo::GetSubcomponentCount to determine the number of subcomponents for which version information is returned.
     * @param {Integer} ulSub Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG</a></b>
     * 
     * The ordinal position of the component in the tree.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG</a>*</b>
     * 
     * The number of subcomponents that this component will expose version information about.
     * @see https://docs.microsoft.com/windows/win32/api//msaatext/nf-msaatext-iversioninfo-getsubcomponentcount
     */
    GetSubcomponentCount(ulSub) {
        result := ComCall(3, this, "uint", ulSub, "uint*", &ulCount := 0, "HRESULT")
        return ulCount
    }

    /**
     * Clients call IVersionInfo::GetImplementationID to retrieve a unique identifier for the component.
     * @param {Integer} ulSub Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG</a></b>
     * 
     * The ordinal position of the component in the tree.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * An implementation identifier for the component. The implementation identifier is unique for this component and is used only for comparing components.
     * @see https://docs.microsoft.com/windows/win32/api//msaatext/nf-msaatext-iversioninfo-getimplementationid
     */
    GetImplementationID(ulSub) {
        implid := Guid()
        result := ComCall(4, this, "uint", ulSub, "ptr", implid, "HRESULT")
        return implid
    }

    /**
     * Clients call IVersionInfo::GetBuildVersion to retrieve build information for a specified component.
     * @param {Integer} ulSub Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG</a></b>
     * 
     * The ordinal position of the component in the tree.
     * @param {Pointer<Integer>} pdwMajor Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * The major build version of the component specified in <i>ulSub</i>.
     * @param {Pointer<Integer>} pdwMinor Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * The minor build version of the component specified in <i>ulSub</i>.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK. If not successful, returns a standard <a href="/windows/desktop/WinAuto/return-values">COM error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msaatext/nf-msaatext-iversioninfo-getbuildversion
     */
    GetBuildVersion(ulSub, pdwMajor, pdwMinor) {
        pdwMajorMarshal := pdwMajor is VarRef ? "uint*" : "ptr"
        pdwMinorMarshal := pdwMinor is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", ulSub, pdwMajorMarshal, pdwMajor, pdwMinorMarshal, pdwMinor, "HRESULT")
        return result
    }

    /**
     * Clients call this method to retrieve a description of the component.
     * @param {Integer} ulSub Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG</a></b>
     * 
     * The ordinal position of the component in the tree.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * String of the form of "Company, suite, component, version." This is for human consumption and is not expected to be 
     * 			 parsed.
     * @see https://docs.microsoft.com/windows/win32/api//msaatext/nf-msaatext-iversioninfo-getcomponentdescription
     */
    GetComponentDescription(ulSub) {
        pImplStr := BSTR()
        result := ComCall(6, this, "uint", ulSub, "ptr", pImplStr, "HRESULT")
        return pImplStr
    }

    /**
     * Clients call this method to retrieve a description of the instance.Note  Active Accessibility Text Services is deprecated.
     * @param {Integer} ulSub Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG</a></b>
     * 
     * The ordinal position of the component in the tree.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * Additional useful strings for the component, such as the internal object state.
     * @see https://docs.microsoft.com/windows/win32/api//msaatext/nf-msaatext-iversioninfo-getinstancedescription
     */
    GetInstanceDescription(ulSub) {
        pImplStr := BSTR()
        result := ComCall(7, this, "uint", ulSub, "ptr", pImplStr, "HRESULT")
        return pImplStr
    }
}
