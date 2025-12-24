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
     * @type {Pointer<SAFEARRAY>} 
     */
    ActionVariables {
        get => this.get_ActionVariables()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    ActionVariableDescriptions {
        get => this.get_ActionVariableDescriptions()
    }

    /**
     * Retrieves a list of macros that you can specify in action property values.
     * @remarks
     * 
     * FSRM parses the action property for the macros and substitutes the macro string with the values that are 
     *     specific to the event and computer on which the action occurred.  For example, the following shows how you can 
     *     format the message text for email: 
     *     "User [Source Io Owner] has reached the quota limit for quota on [Quota Path] on server [Server]. The quota limit is [Quota Limit MB] MB and the current usage is [Quota Used MB] MB ([Quota Used Percent]% of limit)."
     * 
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilescreenmanager-get_actionvariables
     */
    get_ActionVariables() {
        result := ComCall(7, this, "ptr*", &variables := 0, "HRESULT")
        return variables
    }

    /**
     * Retrieves the descriptions for the macros contained in the IFsrmFileScreenManager::ActionVariables property.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilescreenmanager-get_actionvariabledescriptions
     */
    get_ActionVariableDescriptions() {
        result := ComCall(8, this, "ptr*", &descriptions := 0, "HRESULT")
        return descriptions
    }

    /**
     * Creates a file screen object.
     * @param {BSTR} path The local directory path to which the file screen applies. The string is limited to 260 characters.
     * @returns {IFsrmFileScreen} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nn-fsrmscreen-ifsrmfilescreen">IFsrmFileScreen</a> interface of the newly created file screen. To add the file screen to FSRM, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">IFsrmFileScreen::Commit</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilescreenmanager-createfilescreen
     */
    CreateFileScreen(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(9, this, "ptr", path, "ptr*", &fileScreen := 0, "HRESULT")
        return IFsrmFileScreen(fileScreen)
    }

    /**
     * Retrieves the specified file screen.
     * @param {BSTR} path The local directory path associated with the file screen that you want to retrieve. The path is limited to 260 characters.
     * @returns {IFsrmFileScreen} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nn-fsrmscreen-ifsrmfilescreen">IFsrmFileScreen</a> interface to the file screen.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilescreenmanager-getfilescreen
     */
    GetFileScreen(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(10, this, "ptr", path, "ptr*", &fileScreen := 0, "HRESULT")
        return IFsrmFileScreen(fileScreen)
    }

    /**
     * Enumerates the file screens for the specified directory and its subdirectories.
     * @param {BSTR} path The local directory path associated with the file screen that you want to retrieve.
     * 
     * If the path ends with "\*", retrieve all file screens associated with the immediate subdirectories of the path (does not include the file screen associated with the path).
     * 
     * If the path ends with "\...", retrieve the file screen for the path and all file screens associated with the immediate subdirectories of the path (recursively).
     * 
     * If the path does not end in "\*" or "\...", retrieve the file screen for the path only.
     * 
     * If path is null or empty, the method returns all file screens.
     * @param {Integer} options The options to use when enumerating the file screens. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmenumoptions">FsrmEnumOptions</a> enumeration.
     * @returns {IFsrmCommittableCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcommittablecollection">IFsrmCommittableCollection</a> interface that contains a collection of file screens.
     * 
     * Each item of the collection is a <b>VARIANT</b> of type <b>VT_DISPATCH</b>. Query the <b>pdispVal</b> member of the variant for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nn-fsrmscreen-ifsrmfilescreen">IFsrmFileScreen</a> interface.
     * 
     * The collection contains only committed file screens; the collection will not contain newly created file screens that have not been committed.
     * 
     * The collection is empty if the path does not contain file screens.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilescreenmanager-enumfilescreens
     */
    EnumFileScreens(path, options) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(11, this, "ptr", path, "int", options, "ptr*", &fileScreens := 0, "HRESULT")
        return IFsrmCommittableCollection(fileScreens)
    }

    /**
     * Creates a file screen exception object.
     * @param {BSTR} path The local directory path to which the file screen exception applies. The path is limited to 260 characters.
     * @returns {IFsrmFileScreenException} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nn-fsrmscreen-ifsrmfilescreenexception">IFsrmFileScreenException</a> interface of the newly created file screen exception. To add the exception to FSRM, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">IFsrmFileScreenException::Commit</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilescreenmanager-createfilescreenexception
     */
    CreateFileScreenException(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(12, this, "ptr", path, "ptr*", &fileScreenException := 0, "HRESULT")
        return IFsrmFileScreenException(fileScreenException)
    }

    /**
     * Retrieves the specified file screen exception.
     * @param {BSTR} path The local directory path associated with the file screen exception that you want to retrieve. The path is limited to 260 characters.
     * @returns {IFsrmFileScreenException} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nn-fsrmscreen-ifsrmfilescreenexception">IFsrmFileScreenException</a> interface to the file screen exception.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilescreenmanager-getfilescreenexception
     */
    GetFileScreenException(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(13, this, "ptr", path, "ptr*", &fileScreenException := 0, "HRESULT")
        return IFsrmFileScreenException(fileScreenException)
    }

    /**
     * Enumerates the file screen exceptions for the specified directory and its subdirectories.
     * @param {BSTR} path The local directory path associated with the file screen exception that you want to retrieve.
     * 
     * If the path ends with "\*", retrieve all exceptions associated with the immediate subdirectories of the path (does not include the exceptions associated with the path).
     * 
     * If the path ends with "\...", retrieve the exception for the path and all exceptions associated with the immediate subdirectories of the path (recursively).
     * 
     * If the path does not end in "\*" or "\...", retrieve the exception for the path only.
     * 
     * If path is null or empty, the method returns all file screen exceptions.
     * @param {Integer} options The options to use when enumerating the exceptions. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmenumoptions">FsrmEnumOptions</a> enumeration.
     * @returns {IFsrmCommittableCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcommittablecollection">IFsrmCommittableCollection</a> interface that contains a collection of file screen exceptions.
     * 
     * Each item of the collection is a <b>VARIANT</b> of type <b>VT_DISPATCH</b>. Query the <b>pdispVal</b> member of the variant for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nn-fsrmscreen-ifsrmfilescreenexception">IFsrmFileScreenException</a> interface.
     * 
     * The collection contains only committed exceptions; the collection will not contain newly created exceptions that have not been committed.
     * 
     * The collection is empty if the path does not contain file screen exceptions.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilescreenmanager-enumfilescreenexceptions
     */
    EnumFileScreenExceptions(path, options) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(14, this, "ptr", path, "int", options, "ptr*", &fileScreenExceptions := 0, "HRESULT")
        return IFsrmCommittableCollection(fileScreenExceptions)
    }

    /**
     * Creates an empty collection to which you can add file screens.
     * @returns {IFsrmCommittableCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcommittablecollection">IFsrmCommittableCollection</a> interface to the newly created collection. To add an object to the collection, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmmutablecollection-add">IFsrmMutableCollection::Add</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilescreenmanager-createfilescreencollection
     */
    CreateFileScreenCollection() {
        result := ComCall(15, this, "ptr*", &collection := 0, "HRESULT")
        return IFsrmCommittableCollection(collection)
    }
}
