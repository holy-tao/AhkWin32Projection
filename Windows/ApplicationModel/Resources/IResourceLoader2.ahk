#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Resources
 * @version WindowsRuntime 1.4
 */
class IResourceLoader2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResourceLoader2
     * @type {Guid}
     */
    static IID => Guid("{10eb6ec6-8138-48c1-bc65-e1f14207367c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStringForUri"]

    /**
     * 
     * @param {Uri} uri_ 
     * @returns {HSTRING} 
     */
    GetStringForUri(uri_) {
        value := HSTRING()
        result := ComCall(6, this, "ptr", uri_, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
