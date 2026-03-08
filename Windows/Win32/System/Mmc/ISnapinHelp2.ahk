#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISnapinHelp.ahk

/**
 * Allows snap-ins to add HTML Help support. (ISnapinHelp2)
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-isnapinhelp2
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class ISnapinHelp2 extends ISnapinHelp{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISnapinHelp2
     * @type {Guid}
     */
    static IID => Guid("{4861a010-20f9-11d2-a510-00c04fb6dd2c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLinkedTopics"]

    /**
     * Enables a snap-in to specify the names and locations of any HTML Help files that are linked to the snap-in's Help file (specified in the GetHelpTopic method).
     * @remarks
     * MMC calls the snap-in's <b>ISnapinHelp2::GetLinkedTopics</b> method only if the snap-in returned <b>S_OK</b> from the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa814944(v=vs.85)">ISnapinHelp2::GetHelpTopic</a> method call.
     * 
     * Allocate the <i>lpCompiledHelpFiles</i> string with the COM API function <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> (or the equivalent) and MMC will release it
     * @returns {PWSTR} A pointer to the address of the null-terminated Unicode string that contains the path of one or more compiled Help files (.chm) that are linked to the snap-in's Help file. A semicolon is used to separate multiple file paths from each other.
     * 
     * When specifying the path, place the file anywhere and specify the full path name.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-isnapinhelp2-getlinkedtopics
     */
    GetLinkedTopics() {
        result := ComCall(4, this, "ptr*", &lpCompiledHelpFiles := 0, "HRESULT")
        return lpCompiledHelpFiles
    }
}
