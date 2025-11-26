#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IADs.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used by an application or component to programmatically start a creation wizard for a specified object class.
 * @see https://docs.microsoft.com/windows/win32/api//dsadmin/nn-dsadmin-idsadmincreateobj
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IDsAdminCreateObj extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDsAdminCreateObj
     * @type {Guid}
     */
    static IID => Guid("{53554a38-f902-11d2-82b9-00c04f68928b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "CreateModal"]

    /**
     * The IDsAdminCreateObj::Initialize method initializes an IDsAdminCreateObj object with data about the container where the object will be created, the class of the object to be created and, possibly, the source object to copy from.
     * @param {IADsContainer} pADsContainerObj Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscontainer">IADsContainer</a> interface that represents the  container where the object will be created. This parameter must not be <b>NULL</b>.
     * @param {IADs} pADsCopySource Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iads">IADs</a> interface of the object from which a copy is made. If the new object is not copied from another object, this parameter is <b>NULL</b>. The copy operation is only supported for user objects.
     * @param {PWSTR} lpszClassName Pointer to a <b>WCHAR</b> string that contains the LDAP name of the object class to be created. This parameter must not be <b>NULL</b>. Supported values are: "user", "computer", "printQueue", "group" and "contact".
     * @returns {HRESULT} If the method succeeds, 
     *       <b>S_OK</b> is returned. If the method fails, an OLE-defined error code is returned.
     * @see https://docs.microsoft.com/windows/win32/api//dsadmin/nf-dsadmin-idsadmincreateobj-initialize
     */
    Initialize(pADsContainerObj, pADsCopySource, lpszClassName) {
        lpszClassName := lpszClassName is String ? StrPtr(lpszClassName) : lpszClassName

        result := ComCall(3, this, "ptr", pADsContainerObj, "ptr", pADsCopySource, "ptr", lpszClassName, "HRESULT")
        return result
    }

    /**
     * The IDsAdminCreateObj::CreateModal method displays the object creation wizard and returns the newly created object. The IDsAdminCreateObj::Initialize method must be called before IDsAdminCreateObj::CreateModal can be called.
     * @param {HWND} hwndParent Contains the window handle of the owner of the wizard. This value cannot be <b>NULL</b>. Use the result of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getdesktopwindow">GetDesktopWindow</a> function if no parent window is available.
     * @returns {IADs} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iads">IADs</a> interface pointer that receives the newly created object. This parameter receives <b>NULL</b> if the object creation wizard fails or is canceled. The caller must release this interface when it is no longer required. This parameter may be <b>NULL</b> if this object is not required.
     * @see https://docs.microsoft.com/windows/win32/api//dsadmin/nf-dsadmin-idsadmincreateobj-createmodal
     */
    CreateModal(hwndParent) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(4, this, "ptr", hwndParent, "ptr*", &ppADsObj := 0, "HRESULT")
        return IADs(ppADsObj)
    }
}
