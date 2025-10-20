#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {VARIANT} varPath 
     * @param {Integer} lPathFormat 
     * @param {Integer} lFormat 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     */
    GetSecurityDescriptor(varPath, lPathFormat, lFormat, pVariant) {
        result := ComCall(7, this, "ptr", varPath, "int", lPathFormat, "int", lFormat, "ptr", pVariant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varPath 
     * @param {Integer} lPathFormat 
     * @param {VARIANT} varData 
     * @param {Integer} lDataFormat 
     * @returns {HRESULT} 
     */
    SetSecurityDescriptor(varPath, lPathFormat, varData, lDataFormat) {
        result := ComCall(8, this, "ptr", varPath, "int", lPathFormat, "ptr", varData, "int", lDataFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varSD 
     * @param {Integer} lDataFormat 
     * @param {Integer} lOutFormat 
     * @param {Pointer<VARIANT>} pResult 
     * @returns {HRESULT} 
     */
    ConvertSecurityDescriptor(varSD, lDataFormat, lOutFormat, pResult) {
        result := ComCall(9, this, "ptr", varSD, "int", lDataFormat, "int", lOutFormat, "ptr", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_SecurityMask(retval) {
        result := ComCall(10, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lnSecurityMask 
     * @returns {HRESULT} 
     */
    put_SecurityMask(lnSecurityMask) {
        result := ComCall(11, this, "int", lnSecurityMask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
