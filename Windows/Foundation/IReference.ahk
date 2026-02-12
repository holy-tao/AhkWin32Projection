#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Enables arbitrary enumerations, structures, and delegate types to be used as property values.
  * 
  * > **.NET**
  * > This interface appears as [Nullable&lt;T&gt;](/dotnet/api/system.nullable-1?view=dotnet-uwp-10.0&preserve-view=true).
  * 
  * > **C++/CX**
  * > This interface appears as [Platform::IBox&lt;T&gt;](/cpp/cppcx/platform-ibox-interface)
 * @remarks
 * When programming with .NET, this interface is hidden, and you should use the [Nullable&lt;T&gt;](/dotnet/api/system.nullable-1?view=dotnet-uwp-10.0&preserve-view=true) class. All Windows Runtime members where the basic IDL signature shows IReference (with a constraint) are, instead, exposed using the syntax of the nullable value type (for example, **bool?** in C#).
 * 
 * When programming with C++/CX, this interface is hidden, and you should use the [Platform::IBox&lt;T&gt;](/cpp/cppcx/platform-ibox-interface) interface. All Windows Runtime members where the basic IDL signature shows IReference (with a constraint) are instead exposed using [Platform::IBox&lt;T&gt;](/cpp/cppcx/platform-ibox-interface) with the template as a particular value type. This is how C++/CX implements nullable value types. For more info, see [Value classes and structs (C++/CX)](/cpp/cppcx/value-classes-and-structs-c-cx).
 * 
 * Because both .NET and C++/CX have projection equivalents, don't implement this interface unless you are using WRL and/or writing code for a Windows Runtime component, and need a nullable value type.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.ireference-1
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class IReference extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IReference
     * @type {Guid}
     */
    static IID => Guid("{61c17706-2d65-11e0-9ae8-d48564015472}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Value"]

    /**
     * @type {Generic} 
     */
    Value {
        get => this.get_Value()
    }

    __New(T, ptr, callbackCreateFlags := "") {
        super.__New(ptr, callbackCreateFlags)

        ; Register generic parameter types
        this.T := T
    }

    /**
     * 
     * @returns {Generic} 
     */
    get_Value() {
        result := ComCall(6, this, "ptr*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return this.T.Call(output_)
    }
}
