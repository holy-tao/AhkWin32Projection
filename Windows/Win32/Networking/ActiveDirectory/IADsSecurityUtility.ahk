#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsSecurityUtility interface is used to get, set, or retrieve the security descriptor on a file, fileshare, or registry key.
 * @remarks
 * 
  * To read the system access-control list (SACL) of a file or directory, the <b>SE_SECURITY_NAME</b> privilege must be enabled for the calling process. For more information about retrieving the SACL for an object, see <a href="https://docs.microsoft.com/windows/desktop/AD/retrieving-an-objectampaposs-sacl">Retrieving an Object's SACL</a>.
  * 
  * For more information and a code example that shows how to use the <b>IADsSecurityUtility</b> interface to add an ACE to a file, see <a href="https://docs.microsoft.com/windows/desktop/ADSI/example-code-for-adding-an-ace-to-a-file">Example Code for Adding an ACE to a File</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadssecurityutility
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsSecurityUtility extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsSecurityUtility
     * @type {Guid}
     */
    static IID => Guid("{a63251b2-5f21-474b-ab52-4a8efad10895}")

    /**
     * The class identifier for ADsSecurityUtility
     * @type {Guid}
     */
    static CLSID => Guid("{f270c64a-ffb8-4ae4-85fe-3a75e5347966}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSecurityDescriptor", "SetSecurityDescriptor", "ConvertSecurityDescriptor", "get_SecurityMask", "put_SecurityMask"]

    /**
     * 
     * @param {VARIANT} varPath 
     * @param {Integer} lPathFormat 
     * @param {Integer} lFormat 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadssecurityutility-getsecuritydescriptor
     */
    GetSecurityDescriptor(varPath, lPathFormat, lFormat) {
        pVariant := VARIANT()
        result := ComCall(7, this, "ptr", varPath, "int", lPathFormat, "int", lFormat, "ptr", pVariant, "HRESULT")
        return pVariant
    }

    /**
     * 
     * @param {VARIANT} varPath 
     * @param {Integer} lPathFormat 
     * @param {VARIANT} varData 
     * @param {Integer} lDataFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadssecurityutility-setsecuritydescriptor
     */
    SetSecurityDescriptor(varPath, lPathFormat, varData, lDataFormat) {
        result := ComCall(8, this, "ptr", varPath, "int", lPathFormat, "ptr", varData, "int", lDataFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varSD 
     * @param {Integer} lDataFormat 
     * @param {Integer} lOutFormat 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadssecurityutility-convertsecuritydescriptor
     */
    ConvertSecurityDescriptor(varSD, lDataFormat, lOutFormat) {
        pResult := VARIANT()
        result := ComCall(9, this, "ptr", varSD, "int", lDataFormat, "int", lOutFormat, "ptr", pResult, "HRESULT")
        return pResult
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadssecurityutility-get_securitymask
     */
    get_SecurityMask() {
        result := ComCall(10, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnSecurityMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadssecurityutility-put_securitymask
     */
    put_SecurityMask(lnSecurityMask) {
        result := ComCall(11, this, "int", lnSecurityMask, "HRESULT")
        return result
    }
}
