#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents the content metadata of this activity in JSON format.
 * @remarks
 * For example, if your activity was reading an RSS feed, the content might include the name of the article and its author.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.iuseractivitycontentinfo
 * @namespace Windows.ApplicationModel.UserActivities
 * @version WindowsRuntime 1.4
 */
class IUserActivityContentInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserActivityContentInfo
     * @type {Guid}
     */
    static IID => Guid("{b399e5ad-137f-409d-822d-e1af27ce08dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ToJson"]

    /**
     * Provide the **UserActivityContentInfo** in the form of a JSON string.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.iuseractivitycontentinfo.tojson
     */
    ToJson() {
        result_ := HSTRING()
        result := ComCall(6, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
