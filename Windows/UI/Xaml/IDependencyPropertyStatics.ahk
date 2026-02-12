#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\DependencyProperty.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IDependencyPropertyStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDependencyPropertyStatics
     * @type {Guid}
     */
    static IID => Guid("{49e5f28f-8259-4d5c-aae0-83d56dbb68d9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UnsetValue", "Register", "RegisterAttached"]

    /**
     * @type {IInspectable} 
     */
    UnsetValue {
        get => this.get_UnsetValue()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_UnsetValue() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
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
     * @param {HSTRING} name 
     * @param {TypeName} propertyType_ 
     * @param {TypeName} ownerType 
     * @param {PropertyMetadata} typeMetadata 
     * @returns {DependencyProperty} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/NetMon2/register-parser
     */
    Register(name, propertyType_, ownerType, typeMetadata) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(7, this, "ptr", name, "ptr", propertyType_, "ptr", ownerType, "ptr", typeMetadata, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(result_)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {TypeName} propertyType_ 
     * @param {TypeName} ownerType 
     * @param {PropertyMetadata} defaultMetadata 
     * @returns {DependencyProperty} 
     */
    RegisterAttached(name, propertyType_, ownerType, defaultMetadata) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(8, this, "ptr", name, "ptr", propertyType_, "ptr", ownerType, "ptr", defaultMetadata, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(result_)
    }
}
