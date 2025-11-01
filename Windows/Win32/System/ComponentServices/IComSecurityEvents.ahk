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
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidActivity 
     * @param {Integer} ObjectID 
     * @param {Pointer<Guid>} guidIID 
     * @param {Integer} iMeth 
     * @param {Integer} cbByteOrig 
     * @param {Pointer<Integer>} pSidOriginalUser 
     * @param {Integer} cbByteCur 
     * @param {Pointer<Integer>} pSidCurrentUser 
     * @param {BOOL} bCurrentUserInpersonatingInProc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomsecurityevents-onauthenticate
     */
    OnAuthenticate(pInfo, guidActivity, ObjectID, guidIID, iMeth, cbByteOrig, pSidOriginalUser, cbByteCur, pSidCurrentUser, bCurrentUserInpersonatingInProc) {
        pSidOriginalUserMarshal := pSidOriginalUser is VarRef ? "char*" : "ptr"
        pSidCurrentUserMarshal := pSidCurrentUser is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", pInfo, "ptr", guidActivity, "uint", ObjectID, "ptr", guidIID, "uint", iMeth, "uint", cbByteOrig, pSidOriginalUserMarshal, pSidOriginalUser, "uint", cbByteCur, pSidCurrentUserMarshal, pSidCurrentUser, "int", bCurrentUserInpersonatingInProc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidActivity 
     * @param {Integer} ObjectID 
     * @param {Pointer<Guid>} guidIID 
     * @param {Integer} iMeth 
     * @param {Integer} cbByteOrig 
     * @param {Pointer<Integer>} pSidOriginalUser 
     * @param {Integer} cbByteCur 
     * @param {Pointer<Integer>} pSidCurrentUser 
     * @param {BOOL} bCurrentUserInpersonatingInProc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomsecurityevents-onauthenticatefail
     */
    OnAuthenticateFail(pInfo, guidActivity, ObjectID, guidIID, iMeth, cbByteOrig, pSidOriginalUser, cbByteCur, pSidCurrentUser, bCurrentUserInpersonatingInProc) {
        pSidOriginalUserMarshal := pSidOriginalUser is VarRef ? "char*" : "ptr"
        pSidCurrentUserMarshal := pSidCurrentUser is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "ptr", pInfo, "ptr", guidActivity, "uint", ObjectID, "ptr", guidIID, "uint", iMeth, "uint", cbByteOrig, pSidOriginalUserMarshal, pSidOriginalUser, "uint", cbByteCur, pSidCurrentUserMarshal, pSidCurrentUser, "int", bCurrentUserInpersonatingInProc, "HRESULT")
        return result
    }
}
