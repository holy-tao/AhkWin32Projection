#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\HttpStreamContent.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class IHttpStreamContentFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpStreamContentFactory
     * @type {Guid}
     */
    static IID => Guid("{f3e64d9d-f725-407e-942f-0eda189809f4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromInputStream"]

    /**
     * 
     * @param {IInputStream} content 
     * @returns {HttpStreamContent} 
     */
    CreateFromInputStream(content) {
        result := ComCall(6, this, "ptr", content, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpStreamContent(value)
    }
}
