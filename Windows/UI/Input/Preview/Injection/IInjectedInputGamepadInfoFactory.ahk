#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\InjectedInputGamepadInfo.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Preview.Injection
 * @version WindowsRuntime 1.4
 */
class IInjectedInputGamepadInfoFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInjectedInputGamepadInfoFactory
     * @type {Guid}
     */
    static IID => Guid("{59596876-6c39-4ec4-8b2a-29ef7de18aca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstanceFromGamepadReading"]

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {GamepadReading} reading 
     * @returns {InjectedInputGamepadInfo} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstanceFromGamepadReading(reading) {
        result := ComCall(6, this, "ptr", reading, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InjectedInputGamepadInfo(value)
    }
}
