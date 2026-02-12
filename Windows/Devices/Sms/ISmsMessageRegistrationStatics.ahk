#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\SmsMessageRegistration.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class ISmsMessageRegistrationStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmsMessageRegistrationStatics
     * @type {Guid}
     */
    static IID => Guid("{63a05464-2898-4778-a03c-6f994907d63a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllRegistrations", "Register"]

    /**
     * @type {IVectorView<SmsMessageRegistration>} 
     */
    AllRegistrations {
        get => this.get_AllRegistrations()
    }

    /**
     * 
     * @returns {IVectorView<SmsMessageRegistration>} 
     */
    get_AllRegistrations() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(SmsMessageRegistration, value)
    }

    /**
     * The Register export function must be implemented in all parser DLLs. The implementation of Register creates and fills-in a property database for a protocol. Network Monitor uses the database to determine which properties the protocol supports.
     * @remarks
     * Network Monitor starts calling the **Register** function as soon as a capture is loaded. Network Monitor calls the **Register** function for each protocol it can identify. The [CreateProtocol](createprotocol.md) function passes a pointer to the **Register** function.
     * 
     * The implementation of **Register** includes calls to the following functions.
     * 
     * -   A call to the [CreatePropertyDatabase](createpropertydatabase.md) and [AddProperty](/previous-versions/bb251873(v=msdn.10)) functions to create a database of all the properties that the protocol supports.
     * -   A call to the [CreateHandoffTable](createhandofftable.md) function is required if the protocol uses a [*handoff set*](h.md).
     * 
     * If the parser DLL contains multiple parsers, and the parser can detect more than one protocol, you must implement a **Register** function for each protocol.
     * 
     * 
     * 
     * | For Information on                                        | See                                                    |
     * |-----------------------------------------------------------|--------------------------------------------------------|
     * | What parsers are, and how they work with Network Monitor. | [Parsers](parsers.md)                                 |
     * | Which entry points are included in the parser DLL.        | [Parser DLL Architecture](parser-dll-architecture.md) |
     * | How to implement **Register**  includes an example.       | [Implementing Register](implementing-register.md)     |
     * @param {HSTRING} id 
     * @param {SmsFilterRules} filterRules 
     * @returns {SmsMessageRegistration} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/NetMon2/register-parser
     */
    Register(id, filterRules) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(7, this, "ptr", id, "ptr", filterRules, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SmsMessageRegistration(value)
    }
}
