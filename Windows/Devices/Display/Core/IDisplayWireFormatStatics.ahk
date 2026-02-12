#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DisplayWireFormat.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class IDisplayWireFormatStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayWireFormatStatics
     * @type {Guid}
     */
    static IID => Guid("{c575a22d-c3e6-5f7a-bdfb-87c6ab8661d5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWithProperties"]

    /**
     * 
     * @param {IIterable<IKeyValuePair<Guid, IInspectable>>} extraProperties 
     * @param {Integer} pixelEncoding 
     * @param {Integer} bitsPerChannel 
     * @param {Integer} colorSpace 
     * @param {Integer} eotf 
     * @param {Integer} hdrMetadata 
     * @returns {DisplayWireFormat} 
     */
    CreateWithProperties(extraProperties, pixelEncoding, bitsPerChannel, colorSpace, eotf, hdrMetadata) {
        result := ComCall(6, this, "ptr", extraProperties, "int", pixelEncoding, "int", bitsPerChannel, "int", colorSpace, "int", eotf, "int", hdrMetadata, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayWireFormat(result_)
    }
}
