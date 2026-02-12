#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\HttpBufferContent.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class IHttpBufferContentFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpBufferContentFactory
     * @type {Guid}
     */
    static IID => Guid("{bc20c193-c41f-4ff7-9123-6435736eadc2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromBuffer", "CreateFromBufferWithOffset"]

    /**
     * 
     * @param {IBuffer} content 
     * @returns {HttpBufferContent} 
     */
    CreateFromBuffer(content) {
        result := ComCall(6, this, "ptr", content, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpBufferContent(value)
    }

    /**
     * 
     * @param {IBuffer} content 
     * @param {Integer} offset 
     * @param {Integer} count 
     * @returns {HttpBufferContent} 
     */
    CreateFromBufferWithOffset(content, offset, count) {
        result := ComCall(7, this, "ptr", content, "uint", offset, "uint", count, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpBufferContent(value)
    }
}
