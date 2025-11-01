#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugSymbols4 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugSymbols4
     * @type {Guid}
     */
    static IID => Guid("{e391bbd8-9d8c-4418-840b-c006592a1752}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSymbolOptions", "AddSymbolOptions", "RemoveSymbolOptions", "SetSymbolOptions", "GetNameByOffset", "GetOffsetByName", "GetNearNameByOffset", "GetLineByOffset", "GetOffsetByLine", "GetNumberModules", "GetModuleByIndex", "GetModuleByModuleName", "GetModuleByOffset", "GetModuleNames", "GetModuleParameters", "GetSymbolModule", "GetTypeName", "GetTypeId", "GetTypeSize", "GetFieldOffset", "GetSymbolTypeId", "GetOffsetTypeId", "ReadTypedDataVirtual", "WriteTypedDataVirtual", "OutputTypedDataVirtual", "ReadTypedDataPhysical", "WriteTypedDataPhysical", "OutputTypedDataPhysical", "GetScope", "SetScope", "ResetScope", "GetScopeSymbolGroup", "CreateSymbolGroup", "StartSymbolMatch", "GetNextSymbolMatch", "EndSymbolMatch", "Reload", "GetSymbolPath", "SetSymbolPath", "AppendSymbolPath", "GetImagePath", "SetImagePath", "AppendImagePath", "GetSourcePath", "GetSourcePathElement", "SetSourcePath", "AppendSourcePath", "FindSourceFile", "GetSourceFileLineOffsets", "GetModuleVersionInformation", "GetModuleNameString", "GetConstantName", "GetFieldName", "GetTypeOptions", "AddTypeOptions", "RemoveTypeOptions", "SetTypeOptions", "GetNameByOffsetWide", "GetOffsetByNameWide", "GetNearNameByOffsetWide", "GetLineByOffsetWide", "GetOffsetByLineWide", "GetModuleByModuleNameWide", "GetSymbolModuleWide", "GetTypeNameWide", "GetTypeIdWide", "GetFieldOffsetWide", "GetSymbolTypeIdWide", "GetScopeSymbolGroup2", "CreateSymbolGroup2", "StartSymbolMatchWide", "GetNextSymbolMatchWide", "ReloadWide", "GetSymbolPathWide", "SetSymbolPathWide", "AppendSymbolPathWide", "GetImagePathWide", "SetImagePathWide", "AppendImagePathWide", "GetSourcePathWide", "GetSourcePathElementWide", "SetSourcePathWide", "AppendSourcePathWide", "FindSourceFileWide", "GetSourceFileLineOffsetsWide", "GetModuleVersionInformationWide", "GetModuleNameStringWide", "GetConstantNameWide", "GetFieldNameWide", "IsManagedModule", "GetModuleByModuleName2", "GetModuleByModuleName2Wide", "GetModuleByOffset2", "AddSyntheticModule", "AddSyntheticModuleWide", "RemoveSyntheticModule", "GetCurrentScopeFrameIndex", "SetScopeFrameByIndex", "SetScopeFromJitDebugInfo", "SetScopeFromStoredEvent", "OutputSymbolByOffset", "GetFunctionEntryByOffset", "GetFieldTypeAndOffset", "GetFieldTypeAndOffsetWide", "AddSyntheticSymbol", "AddSyntheticSymbolWide", "RemoveSyntheticSymbol", "GetSymbolEntriesByOffset", "GetSymbolEntriesByName", "GetSymbolEntriesByNameWide", "GetSymbolEntryByToken", "GetSymbolEntryInformation", "GetSymbolEntryString", "GetSymbolEntryStringWide", "GetSymbolEntryOffsetRegions", "GetSymbolEntryBySymbolEntry", "GetSourceEntriesByOffset", "GetSourceEntriesByLine", "GetSourceEntriesByLineWide", "GetSourceEntryString", "GetSourceEntryStringWide", "GetSourceEntryOffsetRegions", "GetSourceEntryBySourceEntry", "GetScopeEx", "SetScopeEx", "GetNameByInlineContext", "GetNameByInlineContextWide", "GetLineByInlineContext", "GetLineByInlineContextWide", "OutputSymbolByInlineContext"]

    /**
     * 
     * @param {Pointer<Integer>} Options 
     * @returns {HRESULT} 
     */
    GetSymbolOptions(Options) {
        result := ComCall(3, this, "uint*", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    AddSymbolOptions(Options) {
        result := ComCall(4, this, "uint", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    RemoveSymbolOptions(Options) {
        result := ComCall(5, this, "uint", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    SetSymbolOptions(Options) {
        result := ComCall(6, this, "uint", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {PSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @param {Pointer<Integer>} Displacement 
     * @returns {HRESULT} 
     */
    GetNameByOffset(Offset, NameBuffer, NameBufferSize, NameSize, Displacement) {
        result := ComCall(7, this, "uint", Offset, "ptr", NameBuffer, "uint", NameBufferSize, "uint*", NameSize, "uint*", Displacement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Symbol 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetOffsetByName(Symbol, Offset) {
        result := ComCall(8, this, "ptr", Symbol, "uint*", Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Delta 
     * @param {PSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @param {Pointer<Integer>} Displacement 
     * @returns {HRESULT} 
     */
    GetNearNameByOffset(Offset, Delta, NameBuffer, NameBufferSize, NameSize, Displacement) {
        result := ComCall(9, this, "uint", Offset, "int", Delta, "ptr", NameBuffer, "uint", NameBufferSize, "uint*", NameSize, "uint*", Displacement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer<Integer>} Line 
     * @param {PSTR} FileBuffer 
     * @param {Integer} FileBufferSize 
     * @param {Pointer<Integer>} FileSize 
     * @param {Pointer<Integer>} Displacement 
     * @returns {HRESULT} 
     */
    GetLineByOffset(Offset, Line, FileBuffer, FileBufferSize, FileSize, Displacement) {
        result := ComCall(10, this, "uint", Offset, "uint*", Line, "ptr", FileBuffer, "uint", FileBufferSize, "uint*", FileSize, "uint*", Displacement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Line 
     * @param {PSTR} File 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetOffsetByLine(Line, File, Offset) {
        result := ComCall(11, this, "uint", Line, "ptr", File, "uint*", Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Loaded 
     * @param {Pointer<Integer>} Unloaded 
     * @returns {HRESULT} 
     */
    GetNumberModules(Loaded, Unloaded) {
        result := ComCall(12, this, "uint*", Loaded, "uint*", Unloaded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<Integer>} Base 
     * @returns {HRESULT} 
     */
    GetModuleByIndex(Index, Base) {
        result := ComCall(13, this, "uint", Index, "uint*", Base, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @param {Integer} StartIndex 
     * @param {Pointer<Integer>} Index 
     * @param {Pointer<Integer>} Base 
     * @returns {HRESULT} 
     */
    GetModuleByModuleName(Name, StartIndex, Index, Base) {
        result := ComCall(14, this, "ptr", Name, "uint", StartIndex, "uint*", Index, "uint*", Base, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} StartIndex 
     * @param {Pointer<Integer>} Index 
     * @param {Pointer<Integer>} Base 
     * @returns {HRESULT} 
     */
    GetModuleByOffset(Offset, StartIndex, Index, Base) {
        result := ComCall(15, this, "uint", Offset, "uint", StartIndex, "uint*", Index, "uint*", Base, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Integer} Base 
     * @param {PSTR} ImageNameBuffer 
     * @param {Integer} ImageNameBufferSize 
     * @param {Pointer<Integer>} ImageNameSize 
     * @param {PSTR} ModuleNameBuffer 
     * @param {Integer} ModuleNameBufferSize 
     * @param {Pointer<Integer>} ModuleNameSize 
     * @param {PSTR} LoadedImageNameBuffer 
     * @param {Integer} LoadedImageNameBufferSize 
     * @param {Pointer<Integer>} LoadedImageNameSize 
     * @returns {HRESULT} 
     */
    GetModuleNames(Index, Base, ImageNameBuffer, ImageNameBufferSize, ImageNameSize, ModuleNameBuffer, ModuleNameBufferSize, ModuleNameSize, LoadedImageNameBuffer, LoadedImageNameBufferSize, LoadedImageNameSize) {
        result := ComCall(16, this, "uint", Index, "uint", Base, "ptr", ImageNameBuffer, "uint", ImageNameBufferSize, "uint*", ImageNameSize, "ptr", ModuleNameBuffer, "uint", ModuleNameBufferSize, "uint*", ModuleNameSize, "ptr", LoadedImageNameBuffer, "uint", LoadedImageNameBufferSize, "uint*", LoadedImageNameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<Integer>} Bases 
     * @param {Integer} Start 
     * @param {Pointer<DEBUG_MODULE_PARAMETERS>} Params 
     * @returns {HRESULT} 
     */
    GetModuleParameters(Count, Bases, Start, Params) {
        result := ComCall(17, this, "uint", Count, "uint*", Bases, "uint", Start, "ptr", Params, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Symbol 
     * @param {Pointer<Integer>} Base 
     * @returns {HRESULT} 
     */
    GetSymbolModule(Symbol, Base) {
        result := ComCall(18, this, "ptr", Symbol, "uint*", Base, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {PSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @returns {HRESULT} 
     */
    GetTypeName(Module, TypeId, NameBuffer, NameBufferSize, NameSize) {
        result := ComCall(19, this, "uint", Module, "uint", TypeId, "ptr", NameBuffer, "uint", NameBufferSize, "uint*", NameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Module 
     * @param {PSTR} Name 
     * @param {Pointer<Integer>} TypeId 
     * @returns {HRESULT} 
     */
    GetTypeId(Module, Name, TypeId) {
        result := ComCall(20, this, "uint", Module, "ptr", Name, "uint*", TypeId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Pointer<Integer>} Size 
     * @returns {HRESULT} 
     */
    GetTypeSize(Module, TypeId, Size) {
        result := ComCall(21, this, "uint", Module, "uint", TypeId, "uint*", Size, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {PSTR} Field 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetFieldOffset(Module, TypeId, Field, Offset) {
        result := ComCall(22, this, "uint", Module, "uint", TypeId, "ptr", Field, "uint*", Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Symbol 
     * @param {Pointer<Integer>} TypeId 
     * @param {Pointer<Integer>} Module 
     * @returns {HRESULT} 
     */
    GetSymbolTypeId(Symbol, TypeId, Module) {
        result := ComCall(23, this, "ptr", Symbol, "uint*", TypeId, "uint*", Module, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer<Integer>} TypeId 
     * @param {Pointer<Integer>} Module 
     * @returns {HRESULT} 
     */
    GetOffsetTypeId(Offset, TypeId, Module) {
        result := ComCall(24, this, "uint", Offset, "uint*", TypeId, "uint*", Module, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} BytesRead 
     * @returns {HRESULT} 
     */
    ReadTypedDataVirtual(Offset, Module, TypeId, Buffer, BufferSize, BytesRead) {
        result := ComCall(25, this, "uint", Offset, "uint", Module, "uint", TypeId, "ptr", Buffer, "uint", BufferSize, "uint*", BytesRead, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} BytesWritten 
     * @returns {HRESULT} 
     */
    WriteTypedDataVirtual(Offset, Module, TypeId, Buffer, BufferSize, BytesWritten) {
        result := ComCall(26, this, "uint", Offset, "uint", Module, "uint", TypeId, "ptr", Buffer, "uint", BufferSize, "uint*", BytesWritten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Integer} Offset 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    OutputTypedDataVirtual(OutputControl, Offset, Module, TypeId, Flags) {
        result := ComCall(27, this, "uint", OutputControl, "uint", Offset, "uint", Module, "uint", TypeId, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} BytesRead 
     * @returns {HRESULT} 
     */
    ReadTypedDataPhysical(Offset, Module, TypeId, Buffer, BufferSize, BytesRead) {
        result := ComCall(28, this, "uint", Offset, "uint", Module, "uint", TypeId, "ptr", Buffer, "uint", BufferSize, "uint*", BytesRead, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} BytesWritten 
     * @returns {HRESULT} 
     */
    WriteTypedDataPhysical(Offset, Module, TypeId, Buffer, BufferSize, BytesWritten) {
        result := ComCall(29, this, "uint", Offset, "uint", Module, "uint", TypeId, "ptr", Buffer, "uint", BufferSize, "uint*", BytesWritten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Integer} Offset 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    OutputTypedDataPhysical(OutputControl, Offset, Module, TypeId, Flags) {
        result := ComCall(30, this, "uint", OutputControl, "uint", Offset, "uint", Module, "uint", TypeId, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} InstructionOffset 
     * @param {Pointer<DEBUG_STACK_FRAME>} ScopeFrame 
     * @param {Pointer} ScopeContext 
     * @param {Integer} ScopeContextSize 
     * @returns {HRESULT} 
     */
    GetScope(InstructionOffset, ScopeFrame, ScopeContext, ScopeContextSize) {
        result := ComCall(31, this, "uint*", InstructionOffset, "ptr", ScopeFrame, "ptr", ScopeContext, "uint", ScopeContextSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} InstructionOffset 
     * @param {Pointer<DEBUG_STACK_FRAME>} ScopeFrame 
     * @param {Pointer} ScopeContext 
     * @param {Integer} ScopeContextSize 
     * @returns {HRESULT} 
     */
    SetScope(InstructionOffset, ScopeFrame, ScopeContext, ScopeContextSize) {
        result := ComCall(32, this, "uint", InstructionOffset, "ptr", ScopeFrame, "ptr", ScopeContext, "uint", ScopeContextSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetScope() {
        result := ComCall(33, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {IDebugSymbolGroup} Update 
     * @param {Pointer<IDebugSymbolGroup>} Symbols 
     * @returns {HRESULT} 
     */
    GetScopeSymbolGroup(Flags, Update, Symbols) {
        result := ComCall(34, this, "uint", Flags, "ptr", Update, "ptr*", Symbols, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDebugSymbolGroup>} Group 
     * @returns {HRESULT} 
     */
    CreateSymbolGroup(Group) {
        result := ComCall(35, this, "ptr*", Group, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Pattern 
     * @param {Pointer<Integer>} Handle 
     * @returns {HRESULT} 
     */
    StartSymbolMatch(Pattern, Handle) {
        result := ComCall(36, this, "ptr", Pattern, "uint*", Handle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} MatchSize 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetNextSymbolMatch(Handle, Buffer, BufferSize, MatchSize, Offset) {
        result := ComCall(37, this, "uint", Handle, "ptr", Buffer, "uint", BufferSize, "uint*", MatchSize, "uint*", Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @returns {HRESULT} 
     */
    EndSymbolMatch(Handle) {
        result := ComCall(38, this, "uint", Handle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Module 
     * @returns {HRESULT} 
     */
    Reload(Module) {
        result := ComCall(39, this, "ptr", Module, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} PathSize 
     * @returns {HRESULT} 
     */
    GetSymbolPath(Buffer, BufferSize, PathSize) {
        result := ComCall(40, this, "ptr", Buffer, "uint", BufferSize, "uint*", PathSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Path 
     * @returns {HRESULT} 
     */
    SetSymbolPath(Path) {
        result := ComCall(41, this, "ptr", Path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Addition 
     * @returns {HRESULT} 
     */
    AppendSymbolPath(Addition) {
        result := ComCall(42, this, "ptr", Addition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} PathSize 
     * @returns {HRESULT} 
     */
    GetImagePath(Buffer, BufferSize, PathSize) {
        result := ComCall(43, this, "ptr", Buffer, "uint", BufferSize, "uint*", PathSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Path 
     * @returns {HRESULT} 
     */
    SetImagePath(Path) {
        result := ComCall(44, this, "ptr", Path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Addition 
     * @returns {HRESULT} 
     */
    AppendImagePath(Addition) {
        result := ComCall(45, this, "ptr", Addition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} PathSize 
     * @returns {HRESULT} 
     */
    GetSourcePath(Buffer, BufferSize, PathSize) {
        result := ComCall(46, this, "ptr", Buffer, "uint", BufferSize, "uint*", PathSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} ElementSize 
     * @returns {HRESULT} 
     */
    GetSourcePathElement(Index, Buffer, BufferSize, ElementSize) {
        result := ComCall(47, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", ElementSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Path 
     * @returns {HRESULT} 
     */
    SetSourcePath(Path) {
        result := ComCall(48, this, "ptr", Path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Addition 
     * @returns {HRESULT} 
     */
    AppendSourcePath(Addition) {
        result := ComCall(49, this, "ptr", Addition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StartElement 
     * @param {PSTR} File 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} FoundElement 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} FoundSize 
     * @returns {HRESULT} 
     */
    FindSourceFile(StartElement, File, Flags, FoundElement, Buffer, BufferSize, FoundSize) {
        result := ComCall(50, this, "uint", StartElement, "ptr", File, "uint", Flags, "uint*", FoundElement, "ptr", Buffer, "uint", BufferSize, "uint*", FoundSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} File 
     * @param {Pointer<Integer>} Buffer 
     * @param {Integer} BufferLines 
     * @param {Pointer<Integer>} FileLines 
     * @returns {HRESULT} 
     */
    GetSourceFileLineOffsets(File, Buffer, BufferLines, FileLines) {
        result := ComCall(51, this, "ptr", File, "uint*", Buffer, "uint", BufferLines, "uint*", FileLines, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Integer} Base 
     * @param {PSTR} Item 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} VerInfoSize 
     * @returns {HRESULT} 
     */
    GetModuleVersionInformation(Index, Base, Item, Buffer, BufferSize, VerInfoSize) {
        result := ComCall(52, this, "uint", Index, "uint", Base, "ptr", Item, "ptr", Buffer, "uint", BufferSize, "uint*", VerInfoSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Which 
     * @param {Integer} Index 
     * @param {Integer} Base 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @returns {HRESULT} 
     */
    GetModuleNameString(Which, Index, Base, Buffer, BufferSize, NameSize) {
        result := ComCall(53, this, "uint", Which, "uint", Index, "uint", Base, "ptr", Buffer, "uint", BufferSize, "uint*", NameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Integer} Value 
     * @param {PSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @returns {HRESULT} 
     */
    GetConstantName(Module, TypeId, Value, NameBuffer, NameBufferSize, NameSize) {
        result := ComCall(54, this, "uint", Module, "uint", TypeId, "uint", Value, "ptr", NameBuffer, "uint", NameBufferSize, "uint*", NameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Integer} FieldIndex 
     * @param {PSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @returns {HRESULT} 
     */
    GetFieldName(Module, TypeId, FieldIndex, NameBuffer, NameBufferSize, NameSize) {
        result := ComCall(55, this, "uint", Module, "uint", TypeId, "uint", FieldIndex, "ptr", NameBuffer, "uint", NameBufferSize, "uint*", NameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Options 
     * @returns {HRESULT} 
     */
    GetTypeOptions(Options) {
        result := ComCall(56, this, "uint*", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    AddTypeOptions(Options) {
        result := ComCall(57, this, "uint", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    RemoveTypeOptions(Options) {
        result := ComCall(58, this, "uint", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    SetTypeOptions(Options) {
        result := ComCall(59, this, "uint", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {PWSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @param {Pointer<Integer>} Displacement 
     * @returns {HRESULT} 
     */
    GetNameByOffsetWide(Offset, NameBuffer, NameBufferSize, NameSize, Displacement) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        result := ComCall(60, this, "uint", Offset, "ptr", NameBuffer, "uint", NameBufferSize, "uint*", NameSize, "uint*", Displacement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Symbol 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetOffsetByNameWide(Symbol, Offset) {
        Symbol := Symbol is String ? StrPtr(Symbol) : Symbol

        result := ComCall(61, this, "ptr", Symbol, "uint*", Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Delta 
     * @param {PWSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @param {Pointer<Integer>} Displacement 
     * @returns {HRESULT} 
     */
    GetNearNameByOffsetWide(Offset, Delta, NameBuffer, NameBufferSize, NameSize, Displacement) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        result := ComCall(62, this, "uint", Offset, "int", Delta, "ptr", NameBuffer, "uint", NameBufferSize, "uint*", NameSize, "uint*", Displacement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer<Integer>} Line 
     * @param {PWSTR} FileBuffer 
     * @param {Integer} FileBufferSize 
     * @param {Pointer<Integer>} FileSize 
     * @param {Pointer<Integer>} Displacement 
     * @returns {HRESULT} 
     */
    GetLineByOffsetWide(Offset, Line, FileBuffer, FileBufferSize, FileSize, Displacement) {
        FileBuffer := FileBuffer is String ? StrPtr(FileBuffer) : FileBuffer

        result := ComCall(63, this, "uint", Offset, "uint*", Line, "ptr", FileBuffer, "uint", FileBufferSize, "uint*", FileSize, "uint*", Displacement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Line 
     * @param {PWSTR} File 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetOffsetByLineWide(Line, File, Offset) {
        File := File is String ? StrPtr(File) : File

        result := ComCall(64, this, "uint", Line, "ptr", File, "uint*", Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Name 
     * @param {Integer} StartIndex 
     * @param {Pointer<Integer>} Index 
     * @param {Pointer<Integer>} Base 
     * @returns {HRESULT} 
     */
    GetModuleByModuleNameWide(Name, StartIndex, Index, Base) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(65, this, "ptr", Name, "uint", StartIndex, "uint*", Index, "uint*", Base, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Symbol 
     * @param {Pointer<Integer>} Base 
     * @returns {HRESULT} 
     */
    GetSymbolModuleWide(Symbol, Base) {
        Symbol := Symbol is String ? StrPtr(Symbol) : Symbol

        result := ComCall(66, this, "ptr", Symbol, "uint*", Base, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {PWSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @returns {HRESULT} 
     */
    GetTypeNameWide(Module, TypeId, NameBuffer, NameBufferSize, NameSize) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        result := ComCall(67, this, "uint", Module, "uint", TypeId, "ptr", NameBuffer, "uint", NameBufferSize, "uint*", NameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Module 
     * @param {PWSTR} Name 
     * @param {Pointer<Integer>} TypeId 
     * @returns {HRESULT} 
     */
    GetTypeIdWide(Module, Name, TypeId) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(68, this, "uint", Module, "ptr", Name, "uint*", TypeId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {PWSTR} Field 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetFieldOffsetWide(Module, TypeId, Field, Offset) {
        Field := Field is String ? StrPtr(Field) : Field

        result := ComCall(69, this, "uint", Module, "uint", TypeId, "ptr", Field, "uint*", Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Symbol 
     * @param {Pointer<Integer>} TypeId 
     * @param {Pointer<Integer>} Module 
     * @returns {HRESULT} 
     */
    GetSymbolTypeIdWide(Symbol, TypeId, Module) {
        Symbol := Symbol is String ? StrPtr(Symbol) : Symbol

        result := ComCall(70, this, "ptr", Symbol, "uint*", TypeId, "uint*", Module, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {IDebugSymbolGroup2} Update 
     * @param {Pointer<IDebugSymbolGroup2>} Symbols 
     * @returns {HRESULT} 
     */
    GetScopeSymbolGroup2(Flags, Update, Symbols) {
        result := ComCall(71, this, "uint", Flags, "ptr", Update, "ptr*", Symbols, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDebugSymbolGroup2>} Group 
     * @returns {HRESULT} 
     */
    CreateSymbolGroup2(Group) {
        result := ComCall(72, this, "ptr*", Group, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Pattern 
     * @param {Pointer<Integer>} Handle 
     * @returns {HRESULT} 
     */
    StartSymbolMatchWide(Pattern, Handle) {
        Pattern := Pattern is String ? StrPtr(Pattern) : Pattern

        result := ComCall(73, this, "ptr", Pattern, "uint*", Handle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} MatchSize 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetNextSymbolMatchWide(Handle, Buffer, BufferSize, MatchSize, Offset) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(74, this, "uint", Handle, "ptr", Buffer, "uint", BufferSize, "uint*", MatchSize, "uint*", Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Module 
     * @returns {HRESULT} 
     */
    ReloadWide(Module) {
        Module := Module is String ? StrPtr(Module) : Module

        result := ComCall(75, this, "ptr", Module, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} PathSize 
     * @returns {HRESULT} 
     */
    GetSymbolPathWide(Buffer, BufferSize, PathSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(76, this, "ptr", Buffer, "uint", BufferSize, "uint*", PathSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Path 
     * @returns {HRESULT} 
     */
    SetSymbolPathWide(Path) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(77, this, "ptr", Path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Addition 
     * @returns {HRESULT} 
     */
    AppendSymbolPathWide(Addition) {
        Addition := Addition is String ? StrPtr(Addition) : Addition

        result := ComCall(78, this, "ptr", Addition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} PathSize 
     * @returns {HRESULT} 
     */
    GetImagePathWide(Buffer, BufferSize, PathSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(79, this, "ptr", Buffer, "uint", BufferSize, "uint*", PathSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Path 
     * @returns {HRESULT} 
     */
    SetImagePathWide(Path) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(80, this, "ptr", Path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Addition 
     * @returns {HRESULT} 
     */
    AppendImagePathWide(Addition) {
        Addition := Addition is String ? StrPtr(Addition) : Addition

        result := ComCall(81, this, "ptr", Addition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} PathSize 
     * @returns {HRESULT} 
     */
    GetSourcePathWide(Buffer, BufferSize, PathSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(82, this, "ptr", Buffer, "uint", BufferSize, "uint*", PathSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} ElementSize 
     * @returns {HRESULT} 
     */
    GetSourcePathElementWide(Index, Buffer, BufferSize, ElementSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(83, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", ElementSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Path 
     * @returns {HRESULT} 
     */
    SetSourcePathWide(Path) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(84, this, "ptr", Path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Addition 
     * @returns {HRESULT} 
     */
    AppendSourcePathWide(Addition) {
        Addition := Addition is String ? StrPtr(Addition) : Addition

        result := ComCall(85, this, "ptr", Addition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StartElement 
     * @param {PWSTR} File 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} FoundElement 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} FoundSize 
     * @returns {HRESULT} 
     */
    FindSourceFileWide(StartElement, File, Flags, FoundElement, Buffer, BufferSize, FoundSize) {
        File := File is String ? StrPtr(File) : File
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(86, this, "uint", StartElement, "ptr", File, "uint", Flags, "uint*", FoundElement, "ptr", Buffer, "uint", BufferSize, "uint*", FoundSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} File 
     * @param {Pointer<Integer>} Buffer 
     * @param {Integer} BufferLines 
     * @param {Pointer<Integer>} FileLines 
     * @returns {HRESULT} 
     */
    GetSourceFileLineOffsetsWide(File, Buffer, BufferLines, FileLines) {
        File := File is String ? StrPtr(File) : File

        result := ComCall(87, this, "ptr", File, "uint*", Buffer, "uint", BufferLines, "uint*", FileLines, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Integer} Base 
     * @param {PWSTR} Item 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} VerInfoSize 
     * @returns {HRESULT} 
     */
    GetModuleVersionInformationWide(Index, Base, Item, Buffer, BufferSize, VerInfoSize) {
        Item := Item is String ? StrPtr(Item) : Item

        result := ComCall(88, this, "uint", Index, "uint", Base, "ptr", Item, "ptr", Buffer, "uint", BufferSize, "uint*", VerInfoSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Which 
     * @param {Integer} Index 
     * @param {Integer} Base 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @returns {HRESULT} 
     */
    GetModuleNameStringWide(Which, Index, Base, Buffer, BufferSize, NameSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(89, this, "uint", Which, "uint", Index, "uint", Base, "ptr", Buffer, "uint", BufferSize, "uint*", NameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Integer} Value 
     * @param {PWSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @returns {HRESULT} 
     */
    GetConstantNameWide(Module, TypeId, Value, NameBuffer, NameBufferSize, NameSize) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        result := ComCall(90, this, "uint", Module, "uint", TypeId, "uint", Value, "ptr", NameBuffer, "uint", NameBufferSize, "uint*", NameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Integer} FieldIndex 
     * @param {PWSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @returns {HRESULT} 
     */
    GetFieldNameWide(Module, TypeId, FieldIndex, NameBuffer, NameBufferSize, NameSize) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        result := ComCall(91, this, "uint", Module, "uint", TypeId, "uint", FieldIndex, "ptr", NameBuffer, "uint", NameBufferSize, "uint*", NameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Integer} Base 
     * @returns {HRESULT} 
     */
    IsManagedModule(Index, Base) {
        result := ComCall(92, this, "uint", Index, "uint", Base, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @param {Integer} StartIndex 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} Index 
     * @param {Pointer<Integer>} Base 
     * @returns {HRESULT} 
     */
    GetModuleByModuleName2(Name, StartIndex, Flags, Index, Base) {
        result := ComCall(93, this, "ptr", Name, "uint", StartIndex, "uint", Flags, "uint*", Index, "uint*", Base, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Name 
     * @param {Integer} StartIndex 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} Index 
     * @param {Pointer<Integer>} Base 
     * @returns {HRESULT} 
     */
    GetModuleByModuleName2Wide(Name, StartIndex, Flags, Index, Base) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(94, this, "ptr", Name, "uint", StartIndex, "uint", Flags, "uint*", Index, "uint*", Base, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} StartIndex 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} Index 
     * @param {Pointer<Integer>} Base 
     * @returns {HRESULT} 
     */
    GetModuleByOffset2(Offset, StartIndex, Flags, Index, Base) {
        result := ComCall(95, this, "uint", Offset, "uint", StartIndex, "uint", Flags, "uint*", Index, "uint*", Base, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Base 
     * @param {Integer} Size 
     * @param {PSTR} ImagePath 
     * @param {PSTR} ModuleName 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    AddSyntheticModule(Base, Size, ImagePath, ModuleName, Flags) {
        result := ComCall(96, this, "uint", Base, "uint", Size, "ptr", ImagePath, "ptr", ModuleName, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Base 
     * @param {Integer} Size 
     * @param {PWSTR} ImagePath 
     * @param {PWSTR} ModuleName 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    AddSyntheticModuleWide(Base, Size, ImagePath, ModuleName, Flags) {
        ImagePath := ImagePath is String ? StrPtr(ImagePath) : ImagePath
        ModuleName := ModuleName is String ? StrPtr(ModuleName) : ModuleName

        result := ComCall(97, this, "uint", Base, "uint", Size, "ptr", ImagePath, "ptr", ModuleName, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Base 
     * @returns {HRESULT} 
     */
    RemoveSyntheticModule(Base) {
        result := ComCall(98, this, "uint", Base, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Index 
     * @returns {HRESULT} 
     */
    GetCurrentScopeFrameIndex(Index) {
        result := ComCall(99, this, "uint*", Index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {HRESULT} 
     */
    SetScopeFrameByIndex(Index) {
        result := ComCall(100, this, "uint", Index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Integer} InfoOffset 
     * @returns {HRESULT} 
     */
    SetScopeFromJitDebugInfo(OutputControl, InfoOffset) {
        result := ComCall(101, this, "uint", OutputControl, "uint", InfoOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetScopeFromStoredEvent() {
        result := ComCall(102, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Integer} Flags 
     * @param {Integer} Offset 
     * @returns {HRESULT} 
     */
    OutputSymbolByOffset(OutputControl, Flags, Offset) {
        result := ComCall(103, this, "uint", OutputControl, "uint", Flags, "uint", Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Flags 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} BufferNeeded 
     * @returns {HRESULT} 
     */
    GetFunctionEntryByOffset(Offset, Flags, Buffer, BufferSize, BufferNeeded) {
        result := ComCall(104, this, "uint", Offset, "uint", Flags, "ptr", Buffer, "uint", BufferSize, "uint*", BufferNeeded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Module 
     * @param {Integer} ContainerTypeId 
     * @param {PSTR} Field 
     * @param {Pointer<Integer>} FieldTypeId 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetFieldTypeAndOffset(Module, ContainerTypeId, Field, FieldTypeId, Offset) {
        result := ComCall(105, this, "uint", Module, "uint", ContainerTypeId, "ptr", Field, "uint*", FieldTypeId, "uint*", Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Module 
     * @param {Integer} ContainerTypeId 
     * @param {PWSTR} Field 
     * @param {Pointer<Integer>} FieldTypeId 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetFieldTypeAndOffsetWide(Module, ContainerTypeId, Field, FieldTypeId, Offset) {
        Field := Field is String ? StrPtr(Field) : Field

        result := ComCall(106, this, "uint", Module, "uint", ContainerTypeId, "ptr", Field, "uint*", FieldTypeId, "uint*", Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Size 
     * @param {PSTR} Name 
     * @param {Integer} Flags 
     * @param {Pointer<DEBUG_MODULE_AND_ID>} Id 
     * @returns {HRESULT} 
     */
    AddSyntheticSymbol(Offset, Size, Name, Flags, Id) {
        result := ComCall(107, this, "uint", Offset, "uint", Size, "ptr", Name, "uint", Flags, "ptr", Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Size 
     * @param {PWSTR} Name 
     * @param {Integer} Flags 
     * @param {Pointer<DEBUG_MODULE_AND_ID>} Id 
     * @returns {HRESULT} 
     */
    AddSyntheticSymbolWide(Offset, Size, Name, Flags, Id) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(108, this, "uint", Offset, "uint", Size, "ptr", Name, "uint", Flags, "ptr", Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DEBUG_MODULE_AND_ID>} Id 
     * @returns {HRESULT} 
     */
    RemoveSyntheticSymbol(Id) {
        result := ComCall(109, this, "ptr", Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Flags 
     * @param {Pointer<DEBUG_MODULE_AND_ID>} Ids 
     * @param {Pointer<Integer>} Displacements 
     * @param {Integer} IdsCount 
     * @param {Pointer<Integer>} Entries 
     * @returns {HRESULT} 
     */
    GetSymbolEntriesByOffset(Offset, Flags, Ids, Displacements, IdsCount, Entries) {
        result := ComCall(110, this, "uint", Offset, "uint", Flags, "ptr", Ids, "uint*", Displacements, "uint", IdsCount, "uint*", Entries, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Symbol 
     * @param {Integer} Flags 
     * @param {Pointer<DEBUG_MODULE_AND_ID>} Ids 
     * @param {Integer} IdsCount 
     * @param {Pointer<Integer>} Entries 
     * @returns {HRESULT} 
     */
    GetSymbolEntriesByName(Symbol, Flags, Ids, IdsCount, Entries) {
        result := ComCall(111, this, "ptr", Symbol, "uint", Flags, "ptr", Ids, "uint", IdsCount, "uint*", Entries, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Symbol 
     * @param {Integer} Flags 
     * @param {Pointer<DEBUG_MODULE_AND_ID>} Ids 
     * @param {Integer} IdsCount 
     * @param {Pointer<Integer>} Entries 
     * @returns {HRESULT} 
     */
    GetSymbolEntriesByNameWide(Symbol, Flags, Ids, IdsCount, Entries) {
        Symbol := Symbol is String ? StrPtr(Symbol) : Symbol

        result := ComCall(112, this, "ptr", Symbol, "uint", Flags, "ptr", Ids, "uint", IdsCount, "uint*", Entries, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ModuleBase 
     * @param {Integer} Token 
     * @param {Pointer<DEBUG_MODULE_AND_ID>} Id 
     * @returns {HRESULT} 
     */
    GetSymbolEntryByToken(ModuleBase, Token, Id) {
        result := ComCall(113, this, "uint", ModuleBase, "uint", Token, "ptr", Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DEBUG_MODULE_AND_ID>} Id 
     * @param {Pointer<DEBUG_SYMBOL_ENTRY>} Info 
     * @returns {HRESULT} 
     */
    GetSymbolEntryInformation(Id, Info) {
        result := ComCall(114, this, "ptr", Id, "ptr", Info, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DEBUG_MODULE_AND_ID>} Id 
     * @param {Integer} Which 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} StringSize 
     * @returns {HRESULT} 
     */
    GetSymbolEntryString(Id, Which, Buffer, BufferSize, StringSize) {
        result := ComCall(115, this, "ptr", Id, "uint", Which, "ptr", Buffer, "uint", BufferSize, "uint*", StringSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DEBUG_MODULE_AND_ID>} Id 
     * @param {Integer} Which 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} StringSize 
     * @returns {HRESULT} 
     */
    GetSymbolEntryStringWide(Id, Which, Buffer, BufferSize, StringSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(116, this, "ptr", Id, "uint", Which, "ptr", Buffer, "uint", BufferSize, "uint*", StringSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DEBUG_MODULE_AND_ID>} Id 
     * @param {Integer} Flags 
     * @param {Pointer<DEBUG_OFFSET_REGION>} Regions 
     * @param {Integer} RegionsCount 
     * @param {Pointer<Integer>} RegionsAvail 
     * @returns {HRESULT} 
     */
    GetSymbolEntryOffsetRegions(Id, Flags, Regions, RegionsCount, RegionsAvail) {
        result := ComCall(117, this, "ptr", Id, "uint", Flags, "ptr", Regions, "uint", RegionsCount, "uint*", RegionsAvail, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DEBUG_MODULE_AND_ID>} FromId 
     * @param {Integer} Flags 
     * @param {Pointer<DEBUG_MODULE_AND_ID>} ToId 
     * @returns {HRESULT} 
     */
    GetSymbolEntryBySymbolEntry(FromId, Flags, ToId) {
        result := ComCall(118, this, "ptr", FromId, "uint", Flags, "ptr", ToId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Flags 
     * @param {Pointer<DEBUG_SYMBOL_SOURCE_ENTRY>} Entries 
     * @param {Integer} EntriesCount 
     * @param {Pointer<Integer>} EntriesAvail 
     * @returns {HRESULT} 
     */
    GetSourceEntriesByOffset(Offset, Flags, Entries, EntriesCount, EntriesAvail) {
        result := ComCall(119, this, "uint", Offset, "uint", Flags, "ptr", Entries, "uint", EntriesCount, "uint*", EntriesAvail, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Line 
     * @param {PSTR} File 
     * @param {Integer} Flags 
     * @param {Pointer<DEBUG_SYMBOL_SOURCE_ENTRY>} Entries 
     * @param {Integer} EntriesCount 
     * @param {Pointer<Integer>} EntriesAvail 
     * @returns {HRESULT} 
     */
    GetSourceEntriesByLine(Line, File, Flags, Entries, EntriesCount, EntriesAvail) {
        result := ComCall(120, this, "uint", Line, "ptr", File, "uint", Flags, "ptr", Entries, "uint", EntriesCount, "uint*", EntriesAvail, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Line 
     * @param {PWSTR} File 
     * @param {Integer} Flags 
     * @param {Pointer<DEBUG_SYMBOL_SOURCE_ENTRY>} Entries 
     * @param {Integer} EntriesCount 
     * @param {Pointer<Integer>} EntriesAvail 
     * @returns {HRESULT} 
     */
    GetSourceEntriesByLineWide(Line, File, Flags, Entries, EntriesCount, EntriesAvail) {
        File := File is String ? StrPtr(File) : File

        result := ComCall(121, this, "uint", Line, "ptr", File, "uint", Flags, "ptr", Entries, "uint", EntriesCount, "uint*", EntriesAvail, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DEBUG_SYMBOL_SOURCE_ENTRY>} Entry 
     * @param {Integer} Which 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} StringSize 
     * @returns {HRESULT} 
     */
    GetSourceEntryString(Entry, Which, Buffer, BufferSize, StringSize) {
        result := ComCall(122, this, "ptr", Entry, "uint", Which, "ptr", Buffer, "uint", BufferSize, "uint*", StringSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DEBUG_SYMBOL_SOURCE_ENTRY>} Entry 
     * @param {Integer} Which 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} StringSize 
     * @returns {HRESULT} 
     */
    GetSourceEntryStringWide(Entry, Which, Buffer, BufferSize, StringSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(123, this, "ptr", Entry, "uint", Which, "ptr", Buffer, "uint", BufferSize, "uint*", StringSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DEBUG_SYMBOL_SOURCE_ENTRY>} Entry 
     * @param {Integer} Flags 
     * @param {Pointer<DEBUG_OFFSET_REGION>} Regions 
     * @param {Integer} RegionsCount 
     * @param {Pointer<Integer>} RegionsAvail 
     * @returns {HRESULT} 
     */
    GetSourceEntryOffsetRegions(Entry, Flags, Regions, RegionsCount, RegionsAvail) {
        result := ComCall(124, this, "ptr", Entry, "uint", Flags, "ptr", Regions, "uint", RegionsCount, "uint*", RegionsAvail, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DEBUG_SYMBOL_SOURCE_ENTRY>} FromEntry 
     * @param {Integer} Flags 
     * @param {Pointer<DEBUG_SYMBOL_SOURCE_ENTRY>} ToEntry 
     * @returns {HRESULT} 
     */
    GetSourceEntryBySourceEntry(FromEntry, Flags, ToEntry) {
        result := ComCall(125, this, "ptr", FromEntry, "uint", Flags, "ptr", ToEntry, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} InstructionOffset 
     * @param {Pointer<DEBUG_STACK_FRAME_EX>} ScopeFrame 
     * @param {Pointer} ScopeContext 
     * @param {Integer} ScopeContextSize 
     * @returns {HRESULT} 
     */
    GetScopeEx(InstructionOffset, ScopeFrame, ScopeContext, ScopeContextSize) {
        result := ComCall(126, this, "uint*", InstructionOffset, "ptr", ScopeFrame, "ptr", ScopeContext, "uint", ScopeContextSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} InstructionOffset 
     * @param {Pointer<DEBUG_STACK_FRAME_EX>} ScopeFrame 
     * @param {Pointer} ScopeContext 
     * @param {Integer} ScopeContextSize 
     * @returns {HRESULT} 
     */
    SetScopeEx(InstructionOffset, ScopeFrame, ScopeContext, ScopeContextSize) {
        result := ComCall(127, this, "uint", InstructionOffset, "ptr", ScopeFrame, "ptr", ScopeContext, "uint", ScopeContextSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} InlineContext 
     * @param {PSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @param {Pointer<Integer>} Displacement 
     * @returns {HRESULT} 
     */
    GetNameByInlineContext(Offset, InlineContext, NameBuffer, NameBufferSize, NameSize, Displacement) {
        result := ComCall(128, this, "uint", Offset, "uint", InlineContext, "ptr", NameBuffer, "uint", NameBufferSize, "uint*", NameSize, "uint*", Displacement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} InlineContext 
     * @param {PWSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @param {Pointer<Integer>} Displacement 
     * @returns {HRESULT} 
     */
    GetNameByInlineContextWide(Offset, InlineContext, NameBuffer, NameBufferSize, NameSize, Displacement) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        result := ComCall(129, this, "uint", Offset, "uint", InlineContext, "ptr", NameBuffer, "uint", NameBufferSize, "uint*", NameSize, "uint*", Displacement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} InlineContext 
     * @param {Pointer<Integer>} Line 
     * @param {PSTR} FileBuffer 
     * @param {Integer} FileBufferSize 
     * @param {Pointer<Integer>} FileSize 
     * @param {Pointer<Integer>} Displacement 
     * @returns {HRESULT} 
     */
    GetLineByInlineContext(Offset, InlineContext, Line, FileBuffer, FileBufferSize, FileSize, Displacement) {
        result := ComCall(130, this, "uint", Offset, "uint", InlineContext, "uint*", Line, "ptr", FileBuffer, "uint", FileBufferSize, "uint*", FileSize, "uint*", Displacement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} InlineContext 
     * @param {Pointer<Integer>} Line 
     * @param {PWSTR} FileBuffer 
     * @param {Integer} FileBufferSize 
     * @param {Pointer<Integer>} FileSize 
     * @param {Pointer<Integer>} Displacement 
     * @returns {HRESULT} 
     */
    GetLineByInlineContextWide(Offset, InlineContext, Line, FileBuffer, FileBufferSize, FileSize, Displacement) {
        FileBuffer := FileBuffer is String ? StrPtr(FileBuffer) : FileBuffer

        result := ComCall(131, this, "uint", Offset, "uint", InlineContext, "uint*", Line, "ptr", FileBuffer, "uint", FileBufferSize, "uint*", FileSize, "uint*", Displacement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Integer} Flags 
     * @param {Integer} Offset 
     * @param {Integer} InlineContext 
     * @returns {HRESULT} 
     */
    OutputSymbolByInlineContext(OutputControl, Flags, Offset, InlineContext) {
        result := ComCall(132, this, "uint", OutputControl, "uint", Flags, "uint", Offset, "uint", InlineContext, "HRESULT")
        return result
    }
}
