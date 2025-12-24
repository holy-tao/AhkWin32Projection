#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IDisplayHelp interface is introduced in MMC version 1.1.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-idisplayhelp
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IDisplayHelp extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayHelp
     * @type {Guid}
     */
    static IID => Guid("{cc593830-b926-11d1-8063-0000f875a9ce}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowTopic"]

    /**
     * The IDisplayHelp::ShowTopic method displays the specified HTML Help topic in the merged MMC HTML Help file.
     * @param {PWSTR} pszHelpTopic A pointer to a <b>NULL</b>-terminated string specifying the topic to display in the merged MMC HTML Help file. The string must have the following format:
     * 
     * 
     * ```cpp
     * helpfilename::topicfilename
     * ```
     * 
     * 
     * where <i>helpfilename</i> is the file name of the snap-in's HTML Help file (.chm) that MMC merged into the MMC HTML Help collection file (this is the file name only, not the path to the original HTML Help file), and <i>topicfilename</i> is the internal path to the topic file within the snap-in's .chm file. The author of the snap-in's HTML Help file determines whether there is an internal directory structure for the topic HTML files or if all topic HTML files are at the root of the .chm file.
     * 
     * A snap-in tells MMC about its .chm file in its implementation of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa814944(v=vs.85)">ISnapinHelp2::GetHelpTopic</a> method.
     * 
     * For example, if the snap-in had the HTML Help file mysnapin.chm merged into the MMC HTML Help collection file, and a topic HTML file that had the internal file path of htm/help01.htm, the string would have the following form:
     * 
     * 
     * ```cpp
     * mysnapin.chm::htm/help01.htm
     * ```
     * 
     * 
     * If instead the help01.htm topic file is at the root of the mysnapin.chm Help file, the string should have the following form:
     * 
     * 
     * ```cpp
     * mysnapin.chm::/help01.htm
     * ```
     * 
     * 
     * Support for numeric IDs for topics is not included in versions 1.2 and earlier.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-idisplayhelp-showtopic
     */
    ShowTopic(pszHelpTopic) {
        pszHelpTopic := pszHelpTopic is String ? StrPtr(pszHelpTopic) : pszHelpTopic

        result := ComCall(3, this, "ptr", pszHelpTopic, "HRESULT")
        return result
    }
}
