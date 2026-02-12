#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Enables arbitrary enumerations, structures, and delegate types to be used as an array of property values. You can't implement this interface, see Remarks.
 * @remarks
 * You can't implement the IReferenceArray interface or include it in a signature. IReferenceArray is mainly an internal implementation detail of how the Windows Runtime implements boxing and nullable values.
 * 
 * (C++/CX only) In C++/CX, this interface is exposed as [Platform::IBoxArray&lt;T&gt;](/cpp/cppcx/platform-iboxarray-interface). In scenarios such as XAML data-binding in which a collection of either reference types or value types is passed as type Platform::Object^, you can use safe_cast to convert the object to IBoxArray, and then use the [IBoxArray::Value](/cpp/cppcx/platform-array-class#value) property to access the strongly typed Platform::Array object that contains the elements of the collection.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.ireferencearray-1
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class IReferenceArray extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IReferenceArray
     * @type {Guid}
     */
    static IID => Guid("{61c17707-2d65-11e0-9ae8-d48564015472}")

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
     * @param {Pointer<Pointer>} output_ 
     * @returns {HRESULT} 
     */
    get_Value(output_) {
        result := ComCall(6, this, "ptr", output_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
