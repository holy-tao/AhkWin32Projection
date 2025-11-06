#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmFileScreen.ahk
#Include .\IFsrmCommittableCollection.ahk
#Include .\IFsrmFileScreenException.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used to manage file screen objects.
 * @remarks
 * 
  * file screen restricts the types of files that can be stored in a specific directory and its subdirectories. 
  *     For each file screen, there is a configurable list of blocked file groups that define a set of patterns (that are 
  *     based on file name) that will be restricted. When a file is created or renamed, the server evaluates whether the 
  *     file name matches a pattern in any file group configured on a parent portion of the path. If a match is found, the 
  *     file is blocked and a set of actions are initiated.
  * 
  * In addition to configuring file screens, you can create a file screen exception that defines a list of file 
  *     groups that are specifically allowed in a specific directory and its subdirectories. Typically, you will configure 
  *     a file screen exception on a directory that is in the subtree of a directory with a file screen. In this case, the 
  *     file screen exception list takes precedence when evaluating screening rules; files with names that match the name 
  *     patterns in the allowed file groups will not be blocked.
  * 
  * You can create a file screen or a file screen template. The template is used to modify properties in bulk by 
  *     applying the changes to file screens that derive from the file screen template.
  * 
  * To create this object from a script, use the "Fsrm.FsrmFileScreenManager" program 
  *     identifier.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nn-fsrmscreen-ifsrmfilescreenmanager
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmFileScreenManager extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmFileScreenManager
     * @type {Guid}
     */
    static IID => Guid("{ff4fa04e-5a94-4bda-a3a0-d5b4d3c52eba}")

    /**
     * The class identifier for FsrmFileScreenManager
     * @type {Guid}
     */
    static CLSID => Guid("{95941183-db53-4c5f-b37b-7d0921cf9dc7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ActionVariables", "get_ActionVariableDescriptions", "CreateFileScreen", "GetFileScreen", "EnumFileScreens", "CreateFileScreenException", "GetFileScreenException", "EnumFileScreenExceptions", "CreateFileScreenCollection"]

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreenmanager-get_actionvariables
     */
    get_ActionVariables() {
        result := ComCall(7, this, "ptr*", &variables := 0, "HRESULT")
        return variables
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreenmanager-get_actionvariabledescriptions
     */
    get_ActionVariableDescriptions() {
        result := ComCall(8, this, "ptr*", &descriptions := 0, "HRESULT")
        return descriptions
    }

    /**
     * 
     * @param {BSTR} path 
     * @returns {IFsrmFileScreen} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreenmanager-createfilescreen
     */
    CreateFileScreen(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(9, this, "ptr", path, "ptr*", &fileScreen := 0, "HRESULT")
        return IFsrmFileScreen(fileScreen)
    }

    /**
     * 
     * @param {BSTR} path 
     * @returns {IFsrmFileScreen} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreenmanager-getfilescreen
     */
    GetFileScreen(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(10, this, "ptr", path, "ptr*", &fileScreen := 0, "HRESULT")
        return IFsrmFileScreen(fileScreen)
    }

    /**
     * 
     * @param {BSTR} path 
     * @param {Integer} options 
     * @returns {IFsrmCommittableCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreenmanager-enumfilescreens
     */
    EnumFileScreens(path, options) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(11, this, "ptr", path, "int", options, "ptr*", &fileScreens := 0, "HRESULT")
        return IFsrmCommittableCollection(fileScreens)
    }

    /**
     * 
     * @param {BSTR} path 
     * @returns {IFsrmFileScreenException} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreenmanager-createfilescreenexception
     */
    CreateFileScreenException(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(12, this, "ptr", path, "ptr*", &fileScreenException := 0, "HRESULT")
        return IFsrmFileScreenException(fileScreenException)
    }

    /**
     * 
     * @param {BSTR} path 
     * @returns {IFsrmFileScreenException} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreenmanager-getfilescreenexception
     */
    GetFileScreenException(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(13, this, "ptr", path, "ptr*", &fileScreenException := 0, "HRESULT")
        return IFsrmFileScreenException(fileScreenException)
    }

    /**
     * 
     * @param {BSTR} path 
     * @param {Integer} options 
     * @returns {IFsrmCommittableCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreenmanager-enumfilescreenexceptions
     */
    EnumFileScreenExceptions(path, options) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(14, this, "ptr", path, "int", options, "ptr*", &fileScreenExceptions := 0, "HRESULT")
        return IFsrmCommittableCollection(fileScreenExceptions)
    }

    /**
     * 
     * @returns {IFsrmCommittableCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreenmanager-createfilescreencollection
     */
    CreateFileScreenCollection() {
        result := ComCall(15, this, "ptr*", &collection := 0, "HRESULT")
        return IFsrmCommittableCollection(collection)
    }
}
