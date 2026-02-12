#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FileActionEntity.ahk
#Include .\DocumentActionEntity.ahk
#Include .\PhotoActionEntity.ahk
#Include .\TextActionEntity.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class IActionEntityFactory2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionEntityFactory2
     * @type {Guid}
     */
    static IID => Guid("{ea2fb6a5-ec6d-5180-9d30-bc663b84e7b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFileEntity", "CreateDocumentEntity", "CreatePhotoEntity", "CreateTextEntity"]

    /**
     * 
     * @param {HSTRING} path_ 
     * @returns {FileActionEntity} 
     */
    CreateFileEntity(path_) {
        if(path_ is String) {
            pin := HSTRING.Create(path_)
            path_ := pin.Value
        }
        path_ := path_ is Win32Handle ? NumGet(path_, "ptr") : path_

        result := ComCall(6, this, "ptr", path_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FileActionEntity(result_)
    }

    /**
     * 
     * @param {HSTRING} path_ 
     * @returns {DocumentActionEntity} 
     */
    CreateDocumentEntity(path_) {
        if(path_ is String) {
            pin := HSTRING.Create(path_)
            path_ := pin.Value
        }
        path_ := path_ is Win32Handle ? NumGet(path_, "ptr") : path_

        result := ComCall(7, this, "ptr", path_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DocumentActionEntity(result_)
    }

    /**
     * 
     * @param {HSTRING} path_ 
     * @returns {PhotoActionEntity} 
     */
    CreatePhotoEntity(path_) {
        if(path_ is String) {
            pin := HSTRING.Create(path_)
            path_ := pin.Value
        }
        path_ := path_ is Win32Handle ? NumGet(path_, "ptr") : path_

        result := ComCall(8, this, "ptr", path_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PhotoActionEntity(result_)
    }

    /**
     * 
     * @param {HSTRING} text 
     * @returns {TextActionEntity} 
     */
    CreateTextEntity(text) {
        if(text is String) {
            pin := HSTRING.Create(text)
            text := pin.Value
        }
        text := text is Win32Handle ? NumGet(text, "ptr") : text

        result := ComCall(9, this, "ptr", text, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TextActionEntity(result_)
    }
}
