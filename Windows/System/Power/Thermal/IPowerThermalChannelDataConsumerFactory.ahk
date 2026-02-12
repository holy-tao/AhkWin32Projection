#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PowerThermalChannelDataConsumer.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Power.Thermal
 * @version WindowsRuntime 1.4
 */
class IPowerThermalChannelDataConsumerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPowerThermalChannelDataConsumerFactory
     * @type {Guid}
     */
    static IID => Guid("{b42d9ab1-32f0-54bb-899a-9ae0529da381}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance"]

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {Integer} channelIds_length 
     * @param {Pointer<PowerThermalChannelId>} channelIds 
     * @returns {PowerThermalChannelDataConsumer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(channelIds_length, channelIds) {
        result := ComCall(6, this, "uint", channelIds_length, "ptr", channelIds, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PowerThermalChannelDataConsumer(value)
    }
}
