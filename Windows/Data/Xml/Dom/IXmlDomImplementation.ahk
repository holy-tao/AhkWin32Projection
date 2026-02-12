#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Xml.Dom
 * @version WindowsRuntime 1.4
 */
class IXmlDomImplementation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXmlDomImplementation
     * @type {Guid}
     */
    static IID => Guid("{6de58132-f11d-4fbb-8cc6-583cba93112f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["HasFeature"]

    /**
     * 
     * @param {HSTRING} feature 
     * @param {IInspectable} version_ 
     * @returns {Boolean} 
     */
    HasFeature(feature, version_) {
        if(feature is String) {
            pin := HSTRING.Create(feature)
            feature := pin.Value
        }
        feature := feature is Win32Handle ? NumGet(feature, "ptr") : feature

        result := ComCall(6, this, "ptr", feature, "ptr", version_, "int*", &featureSupported := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return featureSupported
    }
}
