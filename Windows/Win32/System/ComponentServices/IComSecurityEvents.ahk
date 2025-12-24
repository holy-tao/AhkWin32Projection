#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Notifies the subscriber if the authentication of a method call succeeded or failed.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icomsecurityevents
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComSecurityEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComSecurityEvents
     * @type {Guid}
     */
    static IID => Guid("{683130ac-2e50-11d2-98a5-00c04f8ee1c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnAuthenticate", "OnAuthenticateFail"]

    /**
     * Generated when a method call level authentication succeeds.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidActivity The identifier of the activity in which the object is created.
     * @param {Integer} ObjectID The just-in-time activated object.
     * @param {Pointer<Guid>} guidIID The IID of the method.
     * @param {Integer} iMeth The v-table index of the method.
     * @param {Integer} cbByteOrig The number of bytes in the security identifier for the original caller.
     * @param {Pointer<Integer>} pSidOriginalUser The security identifier for the original caller.
     * @param {Integer} cbByteCur The number of bytes in the security identifier for the current caller.
     * @param {Pointer<Integer>} pSidCurrentUser The security identifier for the current caller.
     * @param {BOOL} bCurrentUserInpersonatingInProc Indicates whether the current user is impersonating.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomsecurityevents-onauthenticate
     */
    OnAuthenticate(pInfo, guidActivity, ObjectID, guidIID, iMeth, cbByteOrig, pSidOriginalUser, cbByteCur, pSidCurrentUser, bCurrentUserInpersonatingInProc) {
        pSidOriginalUserMarshal := pSidOriginalUser is VarRef ? "char*" : "ptr"
        pSidCurrentUserMarshal := pSidCurrentUser is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", pInfo, "ptr", guidActivity, "uint", ObjectID, "ptr", guidIID, "uint", iMeth, "uint", cbByteOrig, pSidOriginalUserMarshal, pSidOriginalUser, "uint", cbByteCur, pSidCurrentUserMarshal, pSidCurrentUser, "int", bCurrentUserInpersonatingInProc, "HRESULT")
        return result
    }

    /**
     * Generated when a method call level authentication fails.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidActivity The identifier of the activity in which the object is created.
     * @param {Integer} ObjectID The just-in-time activated object.
     * @param {Pointer<Guid>} guidIID The IID of the method.
     * @param {Integer} iMeth The v-table index of the method.
     * @param {Integer} cbByteOrig The number of bytes in the security identifier for the original caller.
     * @param {Pointer<Integer>} pSidOriginalUser The security identifier for the original caller.
     * @param {Integer} cbByteCur The number of bytes in the security identifier for the current caller.
     * @param {Pointer<Integer>} pSidCurrentUser The security identifier for the current caller.
     * @param {BOOL} bCurrentUserInpersonatingInProc Indicates whether the current user is impersonating.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomsecurityevents-onauthenticatefail
     */
    OnAuthenticateFail(pInfo, guidActivity, ObjectID, guidIID, iMeth, cbByteOrig, pSidOriginalUser, cbByteCur, pSidCurrentUser, bCurrentUserInpersonatingInProc) {
        pSidOriginalUserMarshal := pSidOriginalUser is VarRef ? "char*" : "ptr"
        pSidCurrentUserMarshal := pSidCurrentUser is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "ptr", pInfo, "ptr", guidActivity, "uint", ObjectID, "ptr", guidIID, "uint", iMeth, "uint", cbByteOrig, pSidOriginalUserMarshal, pSidOriginalUser, "uint", cbByteCur, pSidCurrentUserMarshal, pSidCurrentUser, "int", bCurrentUserInpersonatingInProc, "HRESULT")
        return result
    }
}
