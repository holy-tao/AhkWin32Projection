#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PowerThermalChannelDataProducer.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Power.Thermal
 * @version WindowsRuntime 1.4
 */
class IPowerThermalChannelDataProducerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPowerThermalChannelDataProducerFactory
     * @type {Guid}
     */
    static IID => Guid("{d2d380cd-e09d-5472-ad62-70061e630067}")

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
     * @returns {PowerThermalChannelDataProducer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(channelIds_length, channelIds) {
        result := ComCall(6, this, "uint", channelIds_length, "ptr", channelIds, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PowerThermalChannelDataProducer(value)
    }
}
