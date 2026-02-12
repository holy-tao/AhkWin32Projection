#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Characterizes the format of the data.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.icontenttypeprovider
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class IContentTypeProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContentTypeProvider
     * @type {Guid}
     */
    static IID => Guid("{97d098a5-3b99-4de9-88a5-e11d2f50c795}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContentType"]

    /**
     * Gets the format of the data.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.icontenttypeprovider.contenttype
     * @type {HSTRING} 
     */
    ContentType {
        get => this.get_ContentType()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContentType() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
