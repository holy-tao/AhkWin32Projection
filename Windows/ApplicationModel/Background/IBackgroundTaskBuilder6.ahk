#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\BackgroundTaskRegistration.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IBackgroundTaskBuilder6 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundTaskBuilder6
     * @type {Guid}
     */
    static IID => Guid("{80b47b17-ec8b-5653-850b-7508a01f52e7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllowRunningTaskInStandby", "put_AllowRunningTaskInStandby", "Validate", "Register"]

    /**
     * @type {Boolean} 
     */
    AllowRunningTaskInStandby {
        get => this.get_AllowRunningTaskInStandby()
        set => this.put_AllowRunningTaskInStandby(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowRunningTaskInStandby() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowRunningTaskInStandby(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The ValidateBitmapInfoHeader function checks a BITMAPINFOHEADER structure for certain common errors that can cause buffer overruns or integer overflows.
     * @remarks
     * This function guards against the following errors:
     * 
     * -   Arithmetic overflow in the structure size or an invalid structure size.
     * -   Invalid value for the **biClrUsed** member.
     * -   Arithmetic overflow in the image size (**biSizeImage**).
     * -   Invalid values for the image size (**biSizeImage**) for RGB formats.
     * 
     * The function does not check whether the structure describes a valid video format.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/validatebitmapinfoheader
     */
    Validate() {
        result := ComCall(8, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
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
     * @param {HSTRING} taskName 
     * @returns {BackgroundTaskRegistration} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/NetMon2/register-parser
     */
    Register(taskName) {
        if(taskName is String) {
            pin := HSTRING.Create(taskName)
            taskName := pin.Value
        }
        taskName := taskName is Win32Handle ? NumGet(taskName, "ptr") : taskName

        result := ComCall(9, this, "ptr", taskName, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BackgroundTaskRegistration(result_)
    }
}
