#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\GattPresentationFormat.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattPresentationFormatStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattPresentationFormatStatics2
     * @type {Guid}
     */
    static IID => Guid("{a9c21713-b82f-435e-b634-21fd85a43c07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FromParts"]

    /**
     * 
     * @param {Integer} formatType 
     * @param {Integer} exponent 
     * @param {Integer} unit_ 
     * @param {Integer} namespaceId 
     * @param {Integer} description 
     * @returns {GattPresentationFormat} 
     */
    FromParts(formatType, exponent, unit_, namespaceId, description) {
        result := ComCall(6, this, "char", formatType, "int", exponent, "ushort", unit_, "char", namespaceId, "ushort", description, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GattPresentationFormat(result_)
    }
}
