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
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidActivity 
     * @param {Integer} ObjectID 
     * @param {Pointer<Guid>} guidIID 
     * @param {Integer} iMeth 
     * @param {Integer} cbByteOrig 
     * @param {Pointer<Byte>} pSidOriginalUser 
     * @param {Integer} cbByteCur 
     * @param {Pointer<Byte>} pSidCurrentUser 
     * @param {BOOL} bCurrentUserInpersonatingInProc 
     * @returns {HRESULT} 
     */
    OnAuthenticate(pInfo, guidActivity, ObjectID, guidIID, iMeth, cbByteOrig, pSidOriginalUser, cbByteCur, pSidCurrentUser, bCurrentUserInpersonatingInProc) {
        result := ComCall(3, this, "ptr", pInfo, "ptr", guidActivity, "uint", ObjectID, "ptr", guidIID, "uint", iMeth, "uint", cbByteOrig, "char*", pSidOriginalUser, "uint", cbByteCur, "char*", pSidCurrentUser, "int", bCurrentUserInpersonatingInProc, "int")
        if(result != 0)
            throw OSError(result)

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
     * @param {Pointer<Byte>} pSidOriginalUser 
     * @param {Integer} cbByteCur 
     * @param {Pointer<Byte>} pSidCurrentUser 
     * @param {BOOL} bCurrentUserInpersonatingInProc 
     * @returns {HRESULT} 
     */
    OnAuthenticateFail(pInfo, guidActivity, ObjectID, guidIID, iMeth, cbByteOrig, pSidOriginalUser, cbByteCur, pSidCurrentUser, bCurrentUserInpersonatingInProc) {
        result := ComCall(4, this, "ptr", pInfo, "ptr", guidActivity, "uint", ObjectID, "ptr", guidIID, "uint", iMeth, "uint", cbByteOrig, "char*", pSidOriginalUser, "uint", cbByteCur, "char*", pSidCurrentUser, "int", bCurrentUserInpersonatingInProc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
