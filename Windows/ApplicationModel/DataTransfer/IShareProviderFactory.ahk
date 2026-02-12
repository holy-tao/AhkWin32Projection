#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ShareProvider.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class IShareProviderFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShareProviderFactory
     * @type {Guid}
     */
    static IID => Guid("{172a174c-e79e-4f6d-b07d-128f469e0296}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * Create Extended Stored Procedures
     * @param {HSTRING} title 
     * @param {RandomAccessStreamReference} displayIcon 
     * @param {Color} backgroundColor 
     * @param {ShareProviderHandler} handler 
     * @returns {ShareProvider} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(title, displayIcon, backgroundColor, handler) {
        if(title is String) {
            pin := HSTRING.Create(title)
            title := pin.Value
        }
        title := title is Win32Handle ? NumGet(title, "ptr") : title

        result := ComCall(6, this, "ptr", title, "ptr", displayIcon, "ptr", backgroundColor, "ptr", handler, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ShareProvider(result_)
    }
}
