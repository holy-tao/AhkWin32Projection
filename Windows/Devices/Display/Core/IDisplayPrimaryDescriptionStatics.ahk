#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DisplayPrimaryDescription.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class IDisplayPrimaryDescriptionStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayPrimaryDescriptionStatics
     * @type {Guid}
     */
    static IID => Guid("{e60e4cfb-36c9-56dd-8fa1-6ff8c4e0ff07}")

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
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Integer} pixelFormat 
     * @param {Integer} colorSpace 
     * @param {Boolean} isStereo 
     * @param {Direct3DMultisampleDescription} multisampleDescription 
     * @returns {DisplayPrimaryDescription} 
     */
    CreateWithProperties(extraProperties, width, height, pixelFormat, colorSpace, isStereo, multisampleDescription) {
        result := ComCall(6, this, "ptr", extraProperties, "uint", width, "uint", height, "int", pixelFormat, "int", colorSpace, "int", isStereo, "ptr", multisampleDescription, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayPrimaryDescription(result_)
    }
}
