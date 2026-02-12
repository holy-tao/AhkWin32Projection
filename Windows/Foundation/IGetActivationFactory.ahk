#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines the implementation for a type that retrieves activation factories.
 * @remarks
 * For typical apps (those that use C#, Visual Basic, C++/CX or JavaScript for programming language), this interface should be considered as an infrastructure piece that the overall Windows Runtime programming experience uses as an implementation detail. There are no common app development scenarios that rely on implementing or using the IGetActivationFactory interface directly.
 * 
 * The scenario that IGetActivationFactory supports is if you are defining Windows Runtime components using WRL, which are packaged as separate executables. In this case, there is no automatic activation as part of the app model, and the component is responsible for the activation of its classes prior to use (through various APIs in the [Windows.ApplicationModel.Core](../windows.applicationmodel.core/windows_applicationmodel_core.md) namespace). For a sample that illustrates how to implement this, see [Creating a  EXE component with C++ sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Windows%208.1%20Store%20app%20samples/99866-Windows%208.1%20Store%20app%20samples/Creating%20a%20Windows%20Runtime%20EXE%20component%20with%20C%2B%2B%20sample/C%23%20and%20C%2B%2B%20and%20JavaScript).
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.igetactivationfactory
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class IGetActivationFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGetActivationFactory
     * @type {Guid}
     */
    static IID => Guid("{4edb8ee2-96dd-49a7-94f7-4607ddab8e3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetActivationFactory"]

    /**
     * Retrieves the implementation of an activation factory.
     * @param {HSTRING} activatableClassId The Activation ID (ACID) of the activatable type produced by the factory.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.igetactivationfactory.getactivationfactory
     */
    GetActivationFactory(activatableClassId) {
        if(activatableClassId is String) {
            pin := HSTRING.Create(activatableClassId)
            activatableClassId := pin.Value
        }
        activatableClassId := activatableClassId is Win32Handle ? NumGet(activatableClassId, "ptr") : activatableClassId

        result := ComCall(6, this, "ptr", activatableClassId, "ptr*", &factory := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(factory)
    }
}
