#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class IApplicationViewTransferContextStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationViewTransferContextStatics
     * @type {Guid}
     */
    static IID => Guid("{15a89d92-dd79-4b0b-bc47-d5f195f14661}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DataPackageFormatId"]

    /**
     * @type {HSTRING} 
     */
    DataPackageFormatId {
        get => this.get_DataPackageFormatId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DataPackageFormatId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
