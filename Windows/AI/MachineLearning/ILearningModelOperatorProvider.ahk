#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * > [!IMPORTANT]
  * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
  * 
  * Describes the operaators for a learning model.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.ilearningmodeloperatorprovider
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class ILearningModelOperatorProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILearningModelOperatorProvider
     * @type {Guid}
     */
    static IID => Guid("{2a222e5d-afb1-47ed-bfad-b5b3a459ec04}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
