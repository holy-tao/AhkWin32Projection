#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITRendezvous interface is the main interface for the Rendezvous control. An application calls the COM CoCreateInstance function on this interface to create the Rendezvous object.
 * @see https://docs.microsoft.com/windows/win32/api//rend/nn-rend-itrendezvous
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITRendezvous extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITRendezvous
     * @type {Guid}
     */
    static IID => Guid("{34621d6b-6cff-11d1-aff7-00c04fc31fee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DefaultDirectories", "EnumerateDefaultDirectories", "CreateDirectory", "CreateDirectoryObject"]

    /**
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itrendezvous-get_defaultdirectories
     */
    get_DefaultDirectories(pVariant) {
        result := ComCall(7, this, "ptr", pVariant, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumDirectory>} ppEnumDirectory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itrendezvous-enumeratedefaultdirectories
     */
    EnumerateDefaultDirectories(ppEnumDirectory) {
        result := ComCall(8, this, "ptr*", ppEnumDirectory, "HRESULT")
        return result
    }

    /**
     * Creates a new directory.
     * @param {Integer} DirectoryType 
     * @param {BSTR} pName 
     * @param {Pointer<ITDirectory>} ppDir 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible errors include the 
     *        following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified directory already exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PATH_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more intermediate directories do not exist; this function will only create the final directory in 
     *         the path.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-createdirectory
     */
    CreateDirectory(DirectoryType, pName, ppDir) {
        pName := pName is String ? BSTR.Alloc(pName).Value : pName

        result := ComCall(9, this, "int", DirectoryType, "ptr", pName, "ptr*", ppDir, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} DirectoryObjectType 
     * @param {BSTR} pName 
     * @param {Pointer<ITDirectoryObject>} ppDirectoryObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itrendezvous-createdirectoryobject
     */
    CreateDirectoryObject(DirectoryObjectType, pName, ppDirectoryObject) {
        pName := pName is String ? BSTR.Alloc(pName).Value : pName

        result := ComCall(10, this, "int", DirectoryObjectType, "ptr", pName, "ptr*", ppDirectoryObject, "HRESULT")
        return result
    }
}
