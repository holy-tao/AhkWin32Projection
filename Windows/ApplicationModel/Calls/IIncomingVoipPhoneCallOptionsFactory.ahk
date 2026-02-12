#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IncomingVoipPhoneCallOptions.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class IIncomingVoipPhoneCallOptionsFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIncomingVoipPhoneCallOptionsFactory
     * @type {Guid}
     */
    static IID => Guid("{74062de4-08f0-5649-bd80-89ea87185c78}")

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
     * @param {IIterable<HSTRING>} associatedDeviceIds 
     * @returns {IncomingVoipPhoneCallOptions} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(associatedDeviceIds) {
        result := ComCall(6, this, "ptr", associatedDeviceIds, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IncomingVoipPhoneCallOptions(value)
    }
}
