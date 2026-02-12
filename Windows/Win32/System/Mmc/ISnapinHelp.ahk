#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Allows snap-ins to add HTML Help support. (ISnapinHelp)
 * @see https://learn.microsoft.com/windows/win32/api//content/mmc/nn-mmc-isnapinhelp
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class ISnapinHelp extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISnapinHelp
     * @type {Guid}
     */
    static IID => Guid("{a6b15ace-df59-11d0-a7dd-00c04fd909dd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetHelpTopic"]

    /**
     * Enables a snap-in to add its compiled HTML Help file to the MMC Help collection file.
     * @remarks
     * MMC calls the snap-in's implementation of this method to get the location of the snap-in's Help file. MMC merges the HTML Help files of all snap-ins with the MMC console HTML Help collection file.
     * 
     * The topic hierarchy from the snap-in's Help file will appear in the table of contents when the collection is viewed.
     * 
     * By merging the HTML Help files, MMC creates a single, integrated HTML Help table of contents, index, and search feature. When a user clicks Help on Microsoft Management Console on the main 
     * <b>Help</b> menu, MMC opens the merged Help file that includes HTML Help files for all snap-ins in the current console file.
     * 
     * Allocate the <i>lpCompiledHelpFile</i> string with the COM API function <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> (or the equivalent) and MMC will release it.
     * @returns {PWSTR} A pointer to the address of the null-terminated Unicode string that contains the path of the compiled Help file (.chm) for the snap-in. When specifying the path, place the file anywhere and specify the full path name.
     * @see https://learn.microsoft.com/windows/win32/api//content/mmc/nf-mmc-isnapinhelp-gethelptopic
     */
    GetHelpTopic() {
        result := ComCall(3, this, "ptr*", &lpCompiledHelpFile := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lpCompiledHelpFile
    }
}
