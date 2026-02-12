#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SignalNotifier.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Threading.Core
 * @version WindowsRuntime 1.4
 */
class ISignalNotifierStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISignalNotifierStatics
     * @type {Guid}
     */
    static IID => Guid("{1c4e4566-8400-46d3-a115-7d0c0dfc9f62}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AttachToEvent", "AttachToEventWithTimeout", "AttachToSemaphore", "AttachToSemaphoreWithTimeout"]

    /**
     * 
     * @param {HSTRING} name 
     * @param {SignalHandler} handler 
     * @returns {SignalNotifier} 
     */
    AttachToEvent(name, handler) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(6, this, "ptr", name, "ptr", handler, "ptr*", &signalNotifier_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SignalNotifier(signalNotifier_)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {SignalHandler} handler 
     * @param {TimeSpan} timeout 
     * @returns {SignalNotifier} 
     */
    AttachToEventWithTimeout(name, handler, timeout) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(7, this, "ptr", name, "ptr", handler, "ptr", timeout, "ptr*", &signalNotifier_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SignalNotifier(signalNotifier_)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {SignalHandler} handler 
     * @returns {SignalNotifier} 
     */
    AttachToSemaphore(name, handler) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(8, this, "ptr", name, "ptr", handler, "ptr*", &signalNotifier_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SignalNotifier(signalNotifier_)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {SignalHandler} handler 
     * @param {TimeSpan} timeout 
     * @returns {SignalNotifier} 
     */
    AttachToSemaphoreWithTimeout(name, handler, timeout) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(9, this, "ptr", name, "ptr", handler, "ptr", timeout, "ptr*", &signalNotifier_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SignalNotifier(signalNotifier_)
    }
}
