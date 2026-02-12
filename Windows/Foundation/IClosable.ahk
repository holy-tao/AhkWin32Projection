#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines a method to release allocated resources.
  * 
  * 
  * 
  * > **.NET**
  * > This interface appears as [System.IDisposable](/dotnet/api/system.idisposable?view=dotnet-uwp-10.0&preserve-view=true).
  * 
  * 
  * 
  * > **C++/CX**
  * > This interface appears as [Platform::IDisposable](/cpp/cppcx/platform-idisposable-interface).
 * @remarks
 * This interface is projected to a different interface for all possible languages, so it should be considered as an infrastructure piece that the overall Windows Runtime programming experience uses as an implementation detail. There are no typical app development scenarios that rely on implementing or using the IClosable interface directly, unless you're using WRL. For more info, see [WRL Integration](/cpp/cppcx/wrl-integration-c-cx).
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.iclosable
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class IClosable extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClosable
     * @type {Guid}
     */
    static IID => Guid("{30d5a829-7fa4-4026-83bb-d75bae4ea99e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Close"]

    /**
     * Releases system resources that are exposed by a Windows Runtime object.
     * 
     * 
     * 
     * > **.NET**
     * > This interface appears as [System.IDisposable](/dotnet/api/system.idisposable?view=dotnet-uwp-10.0&preserve-view=true).
     * 
     * 
     * 
     * > **C++/CX**
     * > This interface appears as [Platform::IDisposable](/cpp/cppcx/platform-idisposable-interface).
     * @remarks
     * Implementation/caller notes that follow are mainly relevant for WRL.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.iclosable.close
     */
    Close() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
