#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\DEBUG_MODULE_AND_ID.ahk" { DEBUG_MODULE_AND_ID }
#Import ".\DEBUG_MODULE_PARAMETERS.ahk" { DEBUG_MODULE_PARAMETERS }
#Import ".\DEBUG_OFFSET_REGION.ahk" { DEBUG_OFFSET_REGION }
#Import ".\DEBUG_STACK_FRAME.ahk" { DEBUG_STACK_FRAME }
#Import ".\DEBUG_STACK_FRAME_EX.ahk" { DEBUG_STACK_FRAME_EX }
#Import ".\DEBUG_SYMBOL_ENTRY.ahk" { DEBUG_SYMBOL_ENTRY }
#Import ".\DEBUG_SYMBOL_SOURCE_ENTRY.ahk" { DEBUG_SYMBOL_SOURCE_ENTRY }
#Import ".\IDebugSymbolGroup.ahk" { IDebugSymbolGroup }
#Import ".\IDebugSymbolGroup2.ahk" { IDebugSymbolGroup2 }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugSymbols4 extends IUnknown {
    /**
     * The interface identifier for IDebugSymbols4
     * @type {Guid}
     */
    static IID := Guid("{e391bbd8-9d8c-4418-840b-c006592a1752}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugSymbols4 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSymbolOptions                : IntPtr
        AddSymbolOptions                : IntPtr
        RemoveSymbolOptions             : IntPtr
        SetSymbolOptions                : IntPtr
        GetNameByOffset                 : IntPtr
        GetOffsetByName                 : IntPtr
        GetNearNameByOffset             : IntPtr
        GetLineByOffset                 : IntPtr
        GetOffsetByLine                 : IntPtr
        GetNumberModules                : IntPtr
        GetModuleByIndex                : IntPtr
        GetModuleByModuleName           : IntPtr
        GetModuleByOffset               : IntPtr
        GetModuleNames                  : IntPtr
        GetModuleParameters             : IntPtr
        GetSymbolModule                 : IntPtr
        GetTypeName                     : IntPtr
        GetTypeId                       : IntPtr
        GetTypeSize                     : IntPtr
        GetFieldOffset                  : IntPtr
        GetSymbolTypeId                 : IntPtr
        GetOffsetTypeId                 : IntPtr
        ReadTypedDataVirtual            : IntPtr
        WriteTypedDataVirtual           : IntPtr
        OutputTypedDataVirtual          : IntPtr
        ReadTypedDataPhysical           : IntPtr
        WriteTypedDataPhysical          : IntPtr
        OutputTypedDataPhysical         : IntPtr
        GetScope                        : IntPtr
        SetScope                        : IntPtr
        ResetScope                      : IntPtr
        GetScopeSymbolGroup             : IntPtr
        CreateSymbolGroup               : IntPtr
        StartSymbolMatch                : IntPtr
        GetNextSymbolMatch              : IntPtr
        EndSymbolMatch                  : IntPtr
        Reload                          : IntPtr
        GetSymbolPath                   : IntPtr
        SetSymbolPath                   : IntPtr
        AppendSymbolPath                : IntPtr
        GetImagePath                    : IntPtr
        SetImagePath                    : IntPtr
        AppendImagePath                 : IntPtr
        GetSourcePath                   : IntPtr
        GetSourcePathElement            : IntPtr
        SetSourcePath                   : IntPtr
        AppendSourcePath                : IntPtr
        FindSourceFile                  : IntPtr
        GetSourceFileLineOffsets        : IntPtr
        GetModuleVersionInformation     : IntPtr
        GetModuleNameString             : IntPtr
        GetConstantName                 : IntPtr
        GetFieldName                    : IntPtr
        GetTypeOptions                  : IntPtr
        AddTypeOptions                  : IntPtr
        RemoveTypeOptions               : IntPtr
        SetTypeOptions                  : IntPtr
        GetNameByOffsetWide             : IntPtr
        GetOffsetByNameWide             : IntPtr
        GetNearNameByOffsetWide         : IntPtr
        GetLineByOffsetWide             : IntPtr
        GetOffsetByLineWide             : IntPtr
        GetModuleByModuleNameWide       : IntPtr
        GetSymbolModuleWide             : IntPtr
        GetTypeNameWide                 : IntPtr
        GetTypeIdWide                   : IntPtr
        GetFieldOffsetWide              : IntPtr
        GetSymbolTypeIdWide             : IntPtr
        GetScopeSymbolGroup2            : IntPtr
        CreateSymbolGroup2              : IntPtr
        StartSymbolMatchWide            : IntPtr
        GetNextSymbolMatchWide          : IntPtr
        ReloadWide                      : IntPtr
        GetSymbolPathWide               : IntPtr
        SetSymbolPathWide               : IntPtr
        AppendSymbolPathWide            : IntPtr
        GetImagePathWide                : IntPtr
        SetImagePathWide                : IntPtr
        AppendImagePathWide             : IntPtr
        GetSourcePathWide               : IntPtr
        GetSourcePathElementWide        : IntPtr
        SetSourcePathWide               : IntPtr
        AppendSourcePathWide            : IntPtr
        FindSourceFileWide              : IntPtr
        GetSourceFileLineOffsetsWide    : IntPtr
        GetModuleVersionInformationWide : IntPtr
        GetModuleNameStringWide         : IntPtr
        GetConstantNameWide             : IntPtr
        GetFieldNameWide                : IntPtr
        IsManagedModule                 : IntPtr
        GetModuleByModuleName2          : IntPtr
        GetModuleByModuleName2Wide      : IntPtr
        GetModuleByOffset2              : IntPtr
        AddSyntheticModule              : IntPtr
        AddSyntheticModuleWide          : IntPtr
        RemoveSyntheticModule           : IntPtr
        GetCurrentScopeFrameIndex       : IntPtr
        SetScopeFrameByIndex            : IntPtr
        SetScopeFromJitDebugInfo        : IntPtr
        SetScopeFromStoredEvent         : IntPtr
        OutputSymbolByOffset            : IntPtr
        GetFunctionEntryByOffset        : IntPtr
        GetFieldTypeAndOffset           : IntPtr
        GetFieldTypeAndOffsetWide       : IntPtr
        AddSyntheticSymbol              : IntPtr
        AddSyntheticSymbolWide          : IntPtr
        RemoveSyntheticSymbol           : IntPtr
        GetSymbolEntriesByOffset        : IntPtr
        GetSymbolEntriesByName          : IntPtr
        GetSymbolEntriesByNameWide      : IntPtr
        GetSymbolEntryByToken           : IntPtr
        GetSymbolEntryInformation       : IntPtr
        GetSymbolEntryString            : IntPtr
        GetSymbolEntryStringWide        : IntPtr
        GetSymbolEntryOffsetRegions     : IntPtr
        GetSymbolEntryBySymbolEntry     : IntPtr
        GetSourceEntriesByOffset        : IntPtr
        GetSourceEntriesByLine          : IntPtr
        GetSourceEntriesByLineWide      : IntPtr
        GetSourceEntryString            : IntPtr
        GetSourceEntryStringWide        : IntPtr
        GetSourceEntryOffsetRegions     : IntPtr
        GetSourceEntryBySourceEntry     : IntPtr
        GetScopeEx                      : IntPtr
        SetScopeEx                      : IntPtr
        GetNameByInlineContext          : IntPtr
        GetNameByInlineContextWide      : IntPtr
        GetLineByInlineContext          : IntPtr
        GetLineByInlineContextWide      : IntPtr
        OutputSymbolByInlineContext     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugSymbols4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @returns {Integer} 
     */
    GetSymbolOptions() {
        result := ComCall(3, this, "uint*", &Options := 0, "HRESULT")
        return Options
    }

    /**
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    AddSymbolOptions(Options) {
        result := ComCall(4, this, UInt32, Options, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    RemoveSymbolOptions(Options) {
        result := ComCall(5, this, UInt32, Options, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    SetSymbolOptions(Options) {
        result := ComCall(6, this, UInt32, Options, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Offset 
     * @param {PSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @param {Pointer<Integer>} Displacement 
     * @returns {HRESULT} 
     */
    GetNameByOffset(Offset, NameBuffer, NameBufferSize, NameSize, Displacement) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        NameBufferMarshal := NameBuffer == 0 ? IntPtr : PSTR
        NameSizeMarshal := NameSize is VarRef ? "uint*" : IntPtr
        NameSizeMarshal := NameSize == 0 ? IntPtr : "uint*"
        DisplacementMarshal := Displacement is VarRef ? "uint*" : IntPtr
        DisplacementMarshal := Displacement == 0 ? IntPtr : "uint*"

        result := ComCall(7, this, Int64, Offset, NameBufferMarshal, NameBuffer, UInt32, NameBufferSize, NameSizeMarshal, NameSize, DisplacementMarshal, Displacement, "HRESULT")
        return result
    }

    /**
     * @param {PSTR} Symbol 
     * @returns {Integer} 
     */
    GetOffsetByName(Symbol) {
        Symbol := Symbol is String ? StrPtr(Symbol) : Symbol

        result := ComCall(8, this, "ptr", Symbol, "uint*", &Offset := 0, "HRESULT")
        return Offset
    }

    /**
     * @param {Integer} Offset 
     * @param {Integer} Delta 
     * @param {PSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @param {Pointer<Integer>} Displacement 
     * @returns {HRESULT} 
     */
    GetNearNameByOffset(Offset, Delta, NameBuffer, NameBufferSize, NameSize, Displacement) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        NameBufferMarshal := NameBuffer == 0 ? IntPtr : PSTR
        NameSizeMarshal := NameSize is VarRef ? "uint*" : IntPtr
        NameSizeMarshal := NameSize == 0 ? IntPtr : "uint*"
        DisplacementMarshal := Displacement is VarRef ? "uint*" : IntPtr
        DisplacementMarshal := Displacement == 0 ? IntPtr : "uint*"

        result := ComCall(9, this, Int64, Offset, Int32, Delta, NameBufferMarshal, NameBuffer, UInt32, NameBufferSize, NameSizeMarshal, NameSize, DisplacementMarshal, Displacement, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Offset 
     * @param {Pointer<Integer>} Line 
     * @param {PSTR} FileBuffer 
     * @param {Integer} FileBufferSize 
     * @param {Pointer<Integer>} FileSize 
     * @param {Pointer<Integer>} Displacement 
     * @returns {HRESULT} 
     */
    GetLineByOffset(Offset, Line, FileBuffer, FileBufferSize, FileSize, Displacement) {
        FileBuffer := FileBuffer is String ? StrPtr(FileBuffer) : FileBuffer

        LineMarshal := Line is VarRef ? "uint*" : IntPtr
        LineMarshal := Line == 0 ? IntPtr : "uint*"
        FileBufferMarshal := FileBuffer == 0 ? IntPtr : PSTR
        FileSizeMarshal := FileSize is VarRef ? "uint*" : IntPtr
        FileSizeMarshal := FileSize == 0 ? IntPtr : "uint*"
        DisplacementMarshal := Displacement is VarRef ? "uint*" : IntPtr
        DisplacementMarshal := Displacement == 0 ? IntPtr : "uint*"

        result := ComCall(10, this, Int64, Offset, LineMarshal, Line, FileBufferMarshal, FileBuffer, UInt32, FileBufferSize, FileSizeMarshal, FileSize, DisplacementMarshal, Displacement, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Line 
     * @param {PSTR} _File 
     * @returns {Integer} 
     */
    GetOffsetByLine(Line, _File) {
        _File := _File is String ? StrPtr(_File) : _File

        result := ComCall(11, this, UInt32, Line, "ptr", _File, "uint*", &Offset := 0, "HRESULT")
        return Offset
    }

    /**
     * @param {Pointer<Integer>} Loaded 
     * @param {Pointer<Integer>} Unloaded 
     * @returns {HRESULT} 
     */
    GetNumberModules(Loaded, Unloaded) {
        LoadedMarshal := Loaded is VarRef ? "uint*" : IntPtr
        UnloadedMarshal := Unloaded is VarRef ? "uint*" : IntPtr

        result := ComCall(12, this, LoadedMarshal, Loaded, UnloadedMarshal, Unloaded, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Index 
     * @returns {Integer} 
     */
    GetModuleByIndex(Index) {
        result := ComCall(13, this, UInt32, Index, "uint*", &Base := 0, "HRESULT")
        return Base
    }

    /**
     * @param {PSTR} Name 
     * @param {Integer} StartIndex 
     * @param {Pointer<Integer>} Index 
     * @param {Pointer<Integer>} Base 
     * @returns {HRESULT} 
     */
    GetModuleByModuleName(Name, StartIndex, Index, Base) {
        Name := Name is String ? StrPtr(Name) : Name

        IndexMarshal := Index is VarRef ? "uint*" : IntPtr
        IndexMarshal := Index == 0 ? IntPtr : "uint*"
        BaseMarshal := Base is VarRef ? "uint*" : IntPtr
        BaseMarshal := Base == 0 ? IntPtr : "uint*"

        result := ComCall(14, this, "ptr", Name, UInt32, StartIndex, IndexMarshal, Index, BaseMarshal, Base, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Offset 
     * @param {Integer} StartIndex 
     * @param {Pointer<Integer>} Index 
     * @param {Pointer<Integer>} Base 
     * @returns {HRESULT} 
     */
    GetModuleByOffset(Offset, StartIndex, Index, Base) {
        IndexMarshal := Index is VarRef ? "uint*" : IntPtr
        IndexMarshal := Index == 0 ? IntPtr : "uint*"
        BaseMarshal := Base is VarRef ? "uint*" : IntPtr
        BaseMarshal := Base == 0 ? IntPtr : "uint*"

        result := ComCall(15, this, Int64, Offset, UInt32, StartIndex, IndexMarshal, Index, BaseMarshal, Base, "HRESULT")
        return result
    }

    /**
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
        ImageNameBuffer := ImageNameBuffer is String ? StrPtr(ImageNameBuffer) : ImageNameBuffer
        ModuleNameBuffer := ModuleNameBuffer is String ? StrPtr(ModuleNameBuffer) : ModuleNameBuffer
        LoadedImageNameBuffer := LoadedImageNameBuffer is String ? StrPtr(LoadedImageNameBuffer) : LoadedImageNameBuffer

        ImageNameBufferMarshal := ImageNameBuffer == 0 ? IntPtr : PSTR
        ImageNameSizeMarshal := ImageNameSize is VarRef ? "uint*" : IntPtr
        ImageNameSizeMarshal := ImageNameSize == 0 ? IntPtr : "uint*"
        ModuleNameBufferMarshal := ModuleNameBuffer == 0 ? IntPtr : PSTR
        ModuleNameSizeMarshal := ModuleNameSize is VarRef ? "uint*" : IntPtr
        ModuleNameSizeMarshal := ModuleNameSize == 0 ? IntPtr : "uint*"
        LoadedImageNameBufferMarshal := LoadedImageNameBuffer == 0 ? IntPtr : PSTR
        LoadedImageNameSizeMarshal := LoadedImageNameSize is VarRef ? "uint*" : IntPtr
        LoadedImageNameSizeMarshal := LoadedImageNameSize == 0 ? IntPtr : "uint*"

        result := ComCall(16, this, UInt32, Index, Int64, Base, ImageNameBufferMarshal, ImageNameBuffer, UInt32, ImageNameBufferSize, ImageNameSizeMarshal, ImageNameSize, ModuleNameBufferMarshal, ModuleNameBuffer, UInt32, ModuleNameBufferSize, ModuleNameSizeMarshal, ModuleNameSize, LoadedImageNameBufferMarshal, LoadedImageNameBuffer, UInt32, LoadedImageNameBufferSize, LoadedImageNameSizeMarshal, LoadedImageNameSize, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Count 
     * @param {Pointer<Integer>} Bases 
     * @param {Integer} Start 
     * @returns {DEBUG_MODULE_PARAMETERS} 
     */
    GetModuleParameters(Count, Bases, Start) {
        BasesMarshal := Bases is VarRef ? "uint*" : IntPtr
        BasesMarshal := Bases == 0 ? IntPtr : "uint*"

        Params := DEBUG_MODULE_PARAMETERS()
        result := ComCall(17, this, UInt32, Count, BasesMarshal, Bases, UInt32, Start, DEBUG_MODULE_PARAMETERS.Ptr, Params, "HRESULT")
        return Params
    }

    /**
     * @param {PSTR} Symbol 
     * @returns {Integer} 
     */
    GetSymbolModule(Symbol) {
        Symbol := Symbol is String ? StrPtr(Symbol) : Symbol

        result := ComCall(18, this, "ptr", Symbol, "uint*", &Base := 0, "HRESULT")
        return Base
    }

    /**
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {PSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @returns {Integer} 
     */
    GetTypeName(Module, TypeId, NameBuffer, NameBufferSize) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        NameBufferMarshal := NameBuffer == 0 ? IntPtr : PSTR

        result := ComCall(19, this, Int64, Module, UInt32, TypeId, NameBufferMarshal, NameBuffer, UInt32, NameBufferSize, "uint*", &NameSize := 0, "HRESULT")
        return NameSize
    }

    /**
     * @param {Integer} Module 
     * @param {PSTR} Name 
     * @returns {Integer} 
     */
    GetTypeId(Module, Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(20, this, Int64, Module, "ptr", Name, "uint*", &TypeId := 0, "HRESULT")
        return TypeId
    }

    /**
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @returns {Integer} 
     */
    GetTypeSize(Module, TypeId) {
        result := ComCall(21, this, Int64, Module, UInt32, TypeId, "uint*", &_Size := 0, "HRESULT")
        return _Size
    }

    /**
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {PSTR} Field 
     * @returns {Integer} 
     */
    GetFieldOffset(Module, TypeId, Field) {
        Field := Field is String ? StrPtr(Field) : Field

        result := ComCall(22, this, Int64, Module, UInt32, TypeId, "ptr", Field, "uint*", &Offset := 0, "HRESULT")
        return Offset
    }

    /**
     * @param {PSTR} Symbol 
     * @param {Pointer<Integer>} TypeId 
     * @param {Pointer<Integer>} Module 
     * @returns {HRESULT} 
     */
    GetSymbolTypeId(Symbol, TypeId, Module) {
        Symbol := Symbol is String ? StrPtr(Symbol) : Symbol

        TypeIdMarshal := TypeId is VarRef ? "uint*" : IntPtr
        ModuleMarshal := Module is VarRef ? "uint*" : IntPtr
        ModuleMarshal := Module == 0 ? IntPtr : "uint*"

        result := ComCall(23, this, "ptr", Symbol, TypeIdMarshal, TypeId, ModuleMarshal, Module, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Offset 
     * @param {Pointer<Integer>} TypeId 
     * @param {Pointer<Integer>} Module 
     * @returns {HRESULT} 
     */
    GetOffsetTypeId(Offset, TypeId, Module) {
        TypeIdMarshal := TypeId is VarRef ? "uint*" : IntPtr
        ModuleMarshal := Module is VarRef ? "uint*" : IntPtr
        ModuleMarshal := Module == 0 ? IntPtr : "uint*"

        result := ComCall(24, this, Int64, Offset, TypeIdMarshal, TypeId, ModuleMarshal, Module, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Offset 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadTypedDataVirtual(Offset, Module, TypeId, _Buffer, BufferSize) {
        result := ComCall(25, this, Int64, Offset, Int64, Module, UInt32, TypeId, IntPtr, _Buffer, UInt32, BufferSize, "uint*", &BytesRead := 0, "HRESULT")
        return BytesRead
    }

    /**
     * @param {Integer} Offset 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    WriteTypedDataVirtual(Offset, Module, TypeId, _Buffer, BufferSize) {
        result := ComCall(26, this, Int64, Offset, Int64, Module, UInt32, TypeId, IntPtr, _Buffer, UInt32, BufferSize, "uint*", &BytesWritten := 0, "HRESULT")
        return BytesWritten
    }

    /**
     * @param {Integer} OutputControl 
     * @param {Integer} Offset 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    OutputTypedDataVirtual(OutputControl, Offset, Module, TypeId, Flags) {
        result := ComCall(27, this, UInt32, OutputControl, Int64, Offset, Int64, Module, UInt32, TypeId, UInt32, Flags, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Offset 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadTypedDataPhysical(Offset, Module, TypeId, _Buffer, BufferSize) {
        result := ComCall(28, this, Int64, Offset, Int64, Module, UInt32, TypeId, IntPtr, _Buffer, UInt32, BufferSize, "uint*", &BytesRead := 0, "HRESULT")
        return BytesRead
    }

    /**
     * @param {Integer} Offset 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    WriteTypedDataPhysical(Offset, Module, TypeId, _Buffer, BufferSize) {
        result := ComCall(29, this, Int64, Offset, Int64, Module, UInt32, TypeId, IntPtr, _Buffer, UInt32, BufferSize, "uint*", &BytesWritten := 0, "HRESULT")
        return BytesWritten
    }

    /**
     * @param {Integer} OutputControl 
     * @param {Integer} Offset 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    OutputTypedDataPhysical(OutputControl, Offset, Module, TypeId, Flags) {
        result := ComCall(30, this, UInt32, OutputControl, Int64, Offset, Int64, Module, UInt32, TypeId, UInt32, Flags, "HRESULT")
        return result
    }

    /**
     * @param {Pointer<Integer>} InstructionOffset 
     * @param {Pointer<DEBUG_STACK_FRAME>} ScopeFrame 
     * @param {Integer} ScopeContext 
     * @param {Integer} ScopeContextSize 
     * @returns {HRESULT} 
     */
    GetScope(InstructionOffset, ScopeFrame, ScopeContext, ScopeContextSize) {
        InstructionOffsetMarshal := InstructionOffset is VarRef ? "uint*" : IntPtr
        InstructionOffsetMarshal := InstructionOffset == 0 ? IntPtr : "uint*"
        ScopeFrameMarshal := ScopeFrame == 0 ? IntPtr : DEBUG_STACK_FRAME.Ptr
        ScopeContextMarshal := ScopeContext == 0 ? IntPtr : IntPtr

        result := ComCall(31, this, InstructionOffsetMarshal, InstructionOffset, ScopeFrameMarshal, ScopeFrame, ScopeContextMarshal, ScopeContext, UInt32, ScopeContextSize, "HRESULT")
        return result
    }

    /**
     * @param {Integer} InstructionOffset 
     * @param {Pointer<DEBUG_STACK_FRAME>} ScopeFrame 
     * @param {Integer} ScopeContext 
     * @param {Integer} ScopeContextSize 
     * @returns {HRESULT} 
     */
    SetScope(InstructionOffset, ScopeFrame, ScopeContext, ScopeContextSize) {
        ScopeFrameMarshal := ScopeFrame == 0 ? IntPtr : DEBUG_STACK_FRAME.Ptr
        ScopeContextMarshal := ScopeContext == 0 ? IntPtr : IntPtr

        result := ComCall(32, this, Int64, InstructionOffset, ScopeFrameMarshal, ScopeFrame, ScopeContextMarshal, ScopeContext, UInt32, ScopeContextSize, "HRESULT")
        return result
    }

    /**
     * @returns {HRESULT} 
     */
    ResetScope() {
        result := ComCall(33, this, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Flags 
     * @param {IDebugSymbolGroup} Update 
     * @returns {IDebugSymbolGroup} 
     */
    GetScopeSymbolGroup(Flags, Update) {
        UpdateMarshal := Update == 0 ? IntPtr : "ptr"

        result := ComCall(34, this, UInt32, Flags, UpdateMarshal, Update, "ptr*", &Symbols := 0, "HRESULT")
        return IDebugSymbolGroup(Symbols)
    }

    /**
     * @returns {IDebugSymbolGroup} 
     */
    CreateSymbolGroup() {
        result := ComCall(35, this, "ptr*", &Group := 0, "HRESULT")
        return IDebugSymbolGroup(Group)
    }

    /**
     * @param {PSTR} Pattern 
     * @returns {Integer} 
     */
    StartSymbolMatch(Pattern) {
        Pattern := Pattern is String ? StrPtr(Pattern) : Pattern

        result := ComCall(36, this, "ptr", Pattern, "uint*", &_Handle := 0, "HRESULT")
        return _Handle
    }

    /**
     * @param {Integer} _Handle 
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} MatchSize 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetNextSymbolMatch(_Handle, _Buffer, BufferSize, MatchSize, Offset) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        _BufferMarshal := _Buffer == 0 ? IntPtr : PSTR
        MatchSizeMarshal := MatchSize is VarRef ? "uint*" : IntPtr
        MatchSizeMarshal := MatchSize == 0 ? IntPtr : "uint*"
        OffsetMarshal := Offset is VarRef ? "uint*" : IntPtr
        OffsetMarshal := Offset == 0 ? IntPtr : "uint*"

        result := ComCall(37, this, Int64, _Handle, _BufferMarshal, _Buffer, UInt32, BufferSize, MatchSizeMarshal, MatchSize, OffsetMarshal, Offset, "HRESULT")
        return result
    }

    /**
     * @param {Integer} _Handle 
     * @returns {HRESULT} 
     */
    EndSymbolMatch(_Handle) {
        result := ComCall(38, this, Int64, _Handle, "HRESULT")
        return result
    }

    /**
     * @param {PSTR} Module 
     * @returns {HRESULT} 
     */
    Reload(Module) {
        Module := Module is String ? StrPtr(Module) : Module

        result := ComCall(39, this, "ptr", Module, "HRESULT")
        return result
    }

    /**
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSymbolPath(_Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        _BufferMarshal := _Buffer == 0 ? IntPtr : PSTR

        result := ComCall(40, this, _BufferMarshal, _Buffer, UInt32, BufferSize, "uint*", &PathSize := 0, "HRESULT")
        return PathSize
    }

    /**
     * @param {PSTR} _Path 
     * @returns {HRESULT} 
     */
    SetSymbolPath(_Path) {
        _Path := _Path is String ? StrPtr(_Path) : _Path

        result := ComCall(41, this, "ptr", _Path, "HRESULT")
        return result
    }

    /**
     * @param {PSTR} Addition 
     * @returns {HRESULT} 
     */
    AppendSymbolPath(Addition) {
        Addition := Addition is String ? StrPtr(Addition) : Addition

        result := ComCall(42, this, "ptr", Addition, "HRESULT")
        return result
    }

    /**
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetImagePath(_Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        _BufferMarshal := _Buffer == 0 ? IntPtr : PSTR

        result := ComCall(43, this, _BufferMarshal, _Buffer, UInt32, BufferSize, "uint*", &PathSize := 0, "HRESULT")
        return PathSize
    }

    /**
     * @param {PSTR} _Path 
     * @returns {HRESULT} 
     */
    SetImagePath(_Path) {
        _Path := _Path is String ? StrPtr(_Path) : _Path

        result := ComCall(44, this, "ptr", _Path, "HRESULT")
        return result
    }

    /**
     * @param {PSTR} Addition 
     * @returns {HRESULT} 
     */
    AppendImagePath(Addition) {
        Addition := Addition is String ? StrPtr(Addition) : Addition

        result := ComCall(45, this, "ptr", Addition, "HRESULT")
        return result
    }

    /**
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSourcePath(_Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        _BufferMarshal := _Buffer == 0 ? IntPtr : PSTR

        result := ComCall(46, this, _BufferMarshal, _Buffer, UInt32, BufferSize, "uint*", &PathSize := 0, "HRESULT")
        return PathSize
    }

    /**
     * @param {Integer} Index 
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSourcePathElement(Index, _Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        _BufferMarshal := _Buffer == 0 ? IntPtr : PSTR

        result := ComCall(47, this, UInt32, Index, _BufferMarshal, _Buffer, UInt32, BufferSize, "uint*", &ElementSize := 0, "HRESULT")
        return ElementSize
    }

    /**
     * @param {PSTR} _Path 
     * @returns {HRESULT} 
     */
    SetSourcePath(_Path) {
        _Path := _Path is String ? StrPtr(_Path) : _Path

        result := ComCall(48, this, "ptr", _Path, "HRESULT")
        return result
    }

    /**
     * @param {PSTR} Addition 
     * @returns {HRESULT} 
     */
    AppendSourcePath(Addition) {
        Addition := Addition is String ? StrPtr(Addition) : Addition

        result := ComCall(49, this, "ptr", Addition, "HRESULT")
        return result
    }

    /**
     * @param {Integer} StartElement 
     * @param {PSTR} _File 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} FoundElement 
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} FoundSize 
     * @returns {HRESULT} 
     */
    FindSourceFile(StartElement, _File, Flags, FoundElement, _Buffer, BufferSize, FoundSize) {
        _File := _File is String ? StrPtr(_File) : _File
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        FoundElementMarshal := FoundElement is VarRef ? "uint*" : IntPtr
        FoundElementMarshal := FoundElement == 0 ? IntPtr : "uint*"
        _BufferMarshal := _Buffer == 0 ? IntPtr : PSTR
        FoundSizeMarshal := FoundSize is VarRef ? "uint*" : IntPtr
        FoundSizeMarshal := FoundSize == 0 ? IntPtr : "uint*"

        result := ComCall(50, this, UInt32, StartElement, "ptr", _File, UInt32, Flags, FoundElementMarshal, FoundElement, _BufferMarshal, _Buffer, UInt32, BufferSize, FoundSizeMarshal, FoundSize, "HRESULT")
        return result
    }

    /**
     * @param {PSTR} _File 
     * @param {Pointer<Integer>} _Buffer 
     * @param {Integer} BufferLines 
     * @param {Pointer<Integer>} FileLines 
     * @returns {HRESULT} 
     */
    GetSourceFileLineOffsets(_File, _Buffer, BufferLines, FileLines) {
        _File := _File is String ? StrPtr(_File) : _File

        _BufferMarshal := _Buffer is VarRef ? "uint*" : IntPtr
        _BufferMarshal := _Buffer == 0 ? IntPtr : "uint*"
        FileLinesMarshal := FileLines is VarRef ? "uint*" : IntPtr
        FileLinesMarshal := FileLines == 0 ? IntPtr : "uint*"

        result := ComCall(51, this, "ptr", _File, _BufferMarshal, _Buffer, UInt32, BufferLines, FileLinesMarshal, FileLines, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Index 
     * @param {Integer} Base 
     * @param {PSTR} Item 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetModuleVersionInformation(Index, Base, Item, _Buffer, BufferSize) {
        Item := Item is String ? StrPtr(Item) : Item

        _BufferMarshal := _Buffer == 0 ? IntPtr : IntPtr

        result := ComCall(52, this, UInt32, Index, Int64, Base, "ptr", Item, _BufferMarshal, _Buffer, UInt32, BufferSize, "uint*", &VerInfoSize := 0, "HRESULT")
        return VerInfoSize
    }

    /**
     * @param {Integer} Which 
     * @param {Integer} Index 
     * @param {Integer} Base 
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetModuleNameString(Which, Index, Base, _Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        _BufferMarshal := _Buffer == 0 ? IntPtr : PSTR

        result := ComCall(53, this, UInt32, Which, UInt32, Index, Int64, Base, _BufferMarshal, _Buffer, UInt32, BufferSize, "uint*", &NameSize := 0, "HRESULT")
        return NameSize
    }

    /**
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Integer} Value 
     * @param {PSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @returns {Integer} 
     */
    GetConstantName(Module, TypeId, Value, NameBuffer, NameBufferSize) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        NameBufferMarshal := NameBuffer == 0 ? IntPtr : PSTR

        result := ComCall(54, this, Int64, Module, UInt32, TypeId, Int64, Value, NameBufferMarshal, NameBuffer, UInt32, NameBufferSize, "uint*", &NameSize := 0, "HRESULT")
        return NameSize
    }

    /**
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Integer} FieldIndex 
     * @param {PSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @returns {Integer} 
     */
    GetFieldName(Module, TypeId, FieldIndex, NameBuffer, NameBufferSize) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        NameBufferMarshal := NameBuffer == 0 ? IntPtr : PSTR

        result := ComCall(55, this, Int64, Module, UInt32, TypeId, UInt32, FieldIndex, NameBufferMarshal, NameBuffer, UInt32, NameBufferSize, "uint*", &NameSize := 0, "HRESULT")
        return NameSize
    }

    /**
     * @returns {Integer} 
     */
    GetTypeOptions() {
        result := ComCall(56, this, "uint*", &Options := 0, "HRESULT")
        return Options
    }

    /**
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    AddTypeOptions(Options) {
        result := ComCall(57, this, UInt32, Options, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    RemoveTypeOptions(Options) {
        result := ComCall(58, this, UInt32, Options, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    SetTypeOptions(Options) {
        result := ComCall(59, this, UInt32, Options, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Offset 
     * @param {PWSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @param {Pointer<Integer>} Displacement 
     * @returns {HRESULT} 
     */
    GetNameByOffsetWide(Offset, NameBuffer, NameBufferSize, NameSize, Displacement) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        NameBufferMarshal := NameBuffer == 0 ? IntPtr : PWSTR
        NameSizeMarshal := NameSize is VarRef ? "uint*" : IntPtr
        NameSizeMarshal := NameSize == 0 ? IntPtr : "uint*"
        DisplacementMarshal := Displacement is VarRef ? "uint*" : IntPtr
        DisplacementMarshal := Displacement == 0 ? IntPtr : "uint*"

        result := ComCall(60, this, Int64, Offset, NameBufferMarshal, NameBuffer, UInt32, NameBufferSize, NameSizeMarshal, NameSize, DisplacementMarshal, Displacement, "HRESULT")
        return result
    }

    /**
     * @param {PWSTR} Symbol 
     * @returns {Integer} 
     */
    GetOffsetByNameWide(Symbol) {
        Symbol := Symbol is String ? StrPtr(Symbol) : Symbol

        result := ComCall(61, this, "ptr", Symbol, "uint*", &Offset := 0, "HRESULT")
        return Offset
    }

    /**
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

        NameBufferMarshal := NameBuffer == 0 ? IntPtr : PWSTR
        NameSizeMarshal := NameSize is VarRef ? "uint*" : IntPtr
        NameSizeMarshal := NameSize == 0 ? IntPtr : "uint*"
        DisplacementMarshal := Displacement is VarRef ? "uint*" : IntPtr
        DisplacementMarshal := Displacement == 0 ? IntPtr : "uint*"

        result := ComCall(62, this, Int64, Offset, Int32, Delta, NameBufferMarshal, NameBuffer, UInt32, NameBufferSize, NameSizeMarshal, NameSize, DisplacementMarshal, Displacement, "HRESULT")
        return result
    }

    /**
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

        LineMarshal := Line is VarRef ? "uint*" : IntPtr
        LineMarshal := Line == 0 ? IntPtr : "uint*"
        FileBufferMarshal := FileBuffer == 0 ? IntPtr : PWSTR
        FileSizeMarshal := FileSize is VarRef ? "uint*" : IntPtr
        FileSizeMarshal := FileSize == 0 ? IntPtr : "uint*"
        DisplacementMarshal := Displacement is VarRef ? "uint*" : IntPtr
        DisplacementMarshal := Displacement == 0 ? IntPtr : "uint*"

        result := ComCall(63, this, Int64, Offset, LineMarshal, Line, FileBufferMarshal, FileBuffer, UInt32, FileBufferSize, FileSizeMarshal, FileSize, DisplacementMarshal, Displacement, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Line 
     * @param {PWSTR} _File 
     * @returns {Integer} 
     */
    GetOffsetByLineWide(Line, _File) {
        _File := _File is String ? StrPtr(_File) : _File

        result := ComCall(64, this, UInt32, Line, "ptr", _File, "uint*", &Offset := 0, "HRESULT")
        return Offset
    }

    /**
     * @param {PWSTR} Name 
     * @param {Integer} StartIndex 
     * @param {Pointer<Integer>} Index 
     * @param {Pointer<Integer>} Base 
     * @returns {HRESULT} 
     */
    GetModuleByModuleNameWide(Name, StartIndex, Index, Base) {
        Name := Name is String ? StrPtr(Name) : Name

        IndexMarshal := Index is VarRef ? "uint*" : IntPtr
        IndexMarshal := Index == 0 ? IntPtr : "uint*"
        BaseMarshal := Base is VarRef ? "uint*" : IntPtr
        BaseMarshal := Base == 0 ? IntPtr : "uint*"

        result := ComCall(65, this, "ptr", Name, UInt32, StartIndex, IndexMarshal, Index, BaseMarshal, Base, "HRESULT")
        return result
    }

    /**
     * @param {PWSTR} Symbol 
     * @returns {Integer} 
     */
    GetSymbolModuleWide(Symbol) {
        Symbol := Symbol is String ? StrPtr(Symbol) : Symbol

        result := ComCall(66, this, "ptr", Symbol, "uint*", &Base := 0, "HRESULT")
        return Base
    }

    /**
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {PWSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @returns {Integer} 
     */
    GetTypeNameWide(Module, TypeId, NameBuffer, NameBufferSize) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        NameBufferMarshal := NameBuffer == 0 ? IntPtr : PWSTR

        result := ComCall(67, this, Int64, Module, UInt32, TypeId, NameBufferMarshal, NameBuffer, UInt32, NameBufferSize, "uint*", &NameSize := 0, "HRESULT")
        return NameSize
    }

    /**
     * @param {Integer} Module 
     * @param {PWSTR} Name 
     * @returns {Integer} 
     */
    GetTypeIdWide(Module, Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(68, this, Int64, Module, "ptr", Name, "uint*", &TypeId := 0, "HRESULT")
        return TypeId
    }

    /**
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {PWSTR} Field 
     * @returns {Integer} 
     */
    GetFieldOffsetWide(Module, TypeId, Field) {
        Field := Field is String ? StrPtr(Field) : Field

        result := ComCall(69, this, Int64, Module, UInt32, TypeId, "ptr", Field, "uint*", &Offset := 0, "HRESULT")
        return Offset
    }

    /**
     * @param {PWSTR} Symbol 
     * @param {Pointer<Integer>} TypeId 
     * @param {Pointer<Integer>} Module 
     * @returns {HRESULT} 
     */
    GetSymbolTypeIdWide(Symbol, TypeId, Module) {
        Symbol := Symbol is String ? StrPtr(Symbol) : Symbol

        TypeIdMarshal := TypeId is VarRef ? "uint*" : IntPtr
        ModuleMarshal := Module is VarRef ? "uint*" : IntPtr
        ModuleMarshal := Module == 0 ? IntPtr : "uint*"

        result := ComCall(70, this, "ptr", Symbol, TypeIdMarshal, TypeId, ModuleMarshal, Module, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Flags 
     * @param {IDebugSymbolGroup2} Update 
     * @returns {IDebugSymbolGroup2} 
     */
    GetScopeSymbolGroup2(Flags, Update) {
        UpdateMarshal := Update == 0 ? IntPtr : "ptr"

        result := ComCall(71, this, UInt32, Flags, UpdateMarshal, Update, "ptr*", &Symbols := 0, "HRESULT")
        return IDebugSymbolGroup2(Symbols)
    }

    /**
     * @returns {IDebugSymbolGroup2} 
     */
    CreateSymbolGroup2() {
        result := ComCall(72, this, "ptr*", &Group := 0, "HRESULT")
        return IDebugSymbolGroup2(Group)
    }

    /**
     * @param {PWSTR} Pattern 
     * @returns {Integer} 
     */
    StartSymbolMatchWide(Pattern) {
        Pattern := Pattern is String ? StrPtr(Pattern) : Pattern

        result := ComCall(73, this, "ptr", Pattern, "uint*", &_Handle := 0, "HRESULT")
        return _Handle
    }

    /**
     * @param {Integer} _Handle 
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} MatchSize 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetNextSymbolMatchWide(_Handle, _Buffer, BufferSize, MatchSize, Offset) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        _BufferMarshal := _Buffer == 0 ? IntPtr : PWSTR
        MatchSizeMarshal := MatchSize is VarRef ? "uint*" : IntPtr
        MatchSizeMarshal := MatchSize == 0 ? IntPtr : "uint*"
        OffsetMarshal := Offset is VarRef ? "uint*" : IntPtr
        OffsetMarshal := Offset == 0 ? IntPtr : "uint*"

        result := ComCall(74, this, Int64, _Handle, _BufferMarshal, _Buffer, UInt32, BufferSize, MatchSizeMarshal, MatchSize, OffsetMarshal, Offset, "HRESULT")
        return result
    }

    /**
     * @param {PWSTR} Module 
     * @returns {HRESULT} 
     */
    ReloadWide(Module) {
        Module := Module is String ? StrPtr(Module) : Module

        result := ComCall(75, this, "ptr", Module, "HRESULT")
        return result
    }

    /**
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSymbolPathWide(_Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        _BufferMarshal := _Buffer == 0 ? IntPtr : PWSTR

        result := ComCall(76, this, _BufferMarshal, _Buffer, UInt32, BufferSize, "uint*", &PathSize := 0, "HRESULT")
        return PathSize
    }

    /**
     * @param {PWSTR} _Path 
     * @returns {HRESULT} 
     */
    SetSymbolPathWide(_Path) {
        _Path := _Path is String ? StrPtr(_Path) : _Path

        result := ComCall(77, this, "ptr", _Path, "HRESULT")
        return result
    }

    /**
     * @param {PWSTR} Addition 
     * @returns {HRESULT} 
     */
    AppendSymbolPathWide(Addition) {
        Addition := Addition is String ? StrPtr(Addition) : Addition

        result := ComCall(78, this, "ptr", Addition, "HRESULT")
        return result
    }

    /**
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetImagePathWide(_Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        _BufferMarshal := _Buffer == 0 ? IntPtr : PWSTR

        result := ComCall(79, this, _BufferMarshal, _Buffer, UInt32, BufferSize, "uint*", &PathSize := 0, "HRESULT")
        return PathSize
    }

    /**
     * @param {PWSTR} _Path 
     * @returns {HRESULT} 
     */
    SetImagePathWide(_Path) {
        _Path := _Path is String ? StrPtr(_Path) : _Path

        result := ComCall(80, this, "ptr", _Path, "HRESULT")
        return result
    }

    /**
     * @param {PWSTR} Addition 
     * @returns {HRESULT} 
     */
    AppendImagePathWide(Addition) {
        Addition := Addition is String ? StrPtr(Addition) : Addition

        result := ComCall(81, this, "ptr", Addition, "HRESULT")
        return result
    }

    /**
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSourcePathWide(_Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        _BufferMarshal := _Buffer == 0 ? IntPtr : PWSTR

        result := ComCall(82, this, _BufferMarshal, _Buffer, UInt32, BufferSize, "uint*", &PathSize := 0, "HRESULT")
        return PathSize
    }

    /**
     * @param {Integer} Index 
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSourcePathElementWide(Index, _Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        _BufferMarshal := _Buffer == 0 ? IntPtr : PWSTR

        result := ComCall(83, this, UInt32, Index, _BufferMarshal, _Buffer, UInt32, BufferSize, "uint*", &ElementSize := 0, "HRESULT")
        return ElementSize
    }

    /**
     * @param {PWSTR} _Path 
     * @returns {HRESULT} 
     */
    SetSourcePathWide(_Path) {
        _Path := _Path is String ? StrPtr(_Path) : _Path

        result := ComCall(84, this, "ptr", _Path, "HRESULT")
        return result
    }

    /**
     * @param {PWSTR} Addition 
     * @returns {HRESULT} 
     */
    AppendSourcePathWide(Addition) {
        Addition := Addition is String ? StrPtr(Addition) : Addition

        result := ComCall(85, this, "ptr", Addition, "HRESULT")
        return result
    }

    /**
     * @param {Integer} StartElement 
     * @param {PWSTR} _File 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} FoundElement 
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} FoundSize 
     * @returns {HRESULT} 
     */
    FindSourceFileWide(StartElement, _File, Flags, FoundElement, _Buffer, BufferSize, FoundSize) {
        _File := _File is String ? StrPtr(_File) : _File
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        FoundElementMarshal := FoundElement is VarRef ? "uint*" : IntPtr
        FoundElementMarshal := FoundElement == 0 ? IntPtr : "uint*"
        _BufferMarshal := _Buffer == 0 ? IntPtr : PWSTR
        FoundSizeMarshal := FoundSize is VarRef ? "uint*" : IntPtr
        FoundSizeMarshal := FoundSize == 0 ? IntPtr : "uint*"

        result := ComCall(86, this, UInt32, StartElement, "ptr", _File, UInt32, Flags, FoundElementMarshal, FoundElement, _BufferMarshal, _Buffer, UInt32, BufferSize, FoundSizeMarshal, FoundSize, "HRESULT")
        return result
    }

    /**
     * @param {PWSTR} _File 
     * @param {Pointer<Integer>} _Buffer 
     * @param {Integer} BufferLines 
     * @param {Pointer<Integer>} FileLines 
     * @returns {HRESULT} 
     */
    GetSourceFileLineOffsetsWide(_File, _Buffer, BufferLines, FileLines) {
        _File := _File is String ? StrPtr(_File) : _File

        _BufferMarshal := _Buffer is VarRef ? "uint*" : IntPtr
        _BufferMarshal := _Buffer == 0 ? IntPtr : "uint*"
        FileLinesMarshal := FileLines is VarRef ? "uint*" : IntPtr
        FileLinesMarshal := FileLines == 0 ? IntPtr : "uint*"

        result := ComCall(87, this, "ptr", _File, _BufferMarshal, _Buffer, UInt32, BufferLines, FileLinesMarshal, FileLines, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Index 
     * @param {Integer} Base 
     * @param {PWSTR} Item 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetModuleVersionInformationWide(Index, Base, Item, _Buffer, BufferSize) {
        Item := Item is String ? StrPtr(Item) : Item

        _BufferMarshal := _Buffer == 0 ? IntPtr : IntPtr

        result := ComCall(88, this, UInt32, Index, Int64, Base, "ptr", Item, _BufferMarshal, _Buffer, UInt32, BufferSize, "uint*", &VerInfoSize := 0, "HRESULT")
        return VerInfoSize
    }

    /**
     * @param {Integer} Which 
     * @param {Integer} Index 
     * @param {Integer} Base 
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetModuleNameStringWide(Which, Index, Base, _Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        _BufferMarshal := _Buffer == 0 ? IntPtr : PWSTR

        result := ComCall(89, this, UInt32, Which, UInt32, Index, Int64, Base, _BufferMarshal, _Buffer, UInt32, BufferSize, "uint*", &NameSize := 0, "HRESULT")
        return NameSize
    }

    /**
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Integer} Value 
     * @param {PWSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @returns {Integer} 
     */
    GetConstantNameWide(Module, TypeId, Value, NameBuffer, NameBufferSize) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        NameBufferMarshal := NameBuffer == 0 ? IntPtr : PWSTR

        result := ComCall(90, this, Int64, Module, UInt32, TypeId, Int64, Value, NameBufferMarshal, NameBuffer, UInt32, NameBufferSize, "uint*", &NameSize := 0, "HRESULT")
        return NameSize
    }

    /**
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Integer} FieldIndex 
     * @param {PWSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @returns {Integer} 
     */
    GetFieldNameWide(Module, TypeId, FieldIndex, NameBuffer, NameBufferSize) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        NameBufferMarshal := NameBuffer == 0 ? IntPtr : PWSTR

        result := ComCall(91, this, Int64, Module, UInt32, TypeId, UInt32, FieldIndex, NameBufferMarshal, NameBuffer, UInt32, NameBufferSize, "uint*", &NameSize := 0, "HRESULT")
        return NameSize
    }

    /**
     * @param {Integer} Index 
     * @param {Integer} Base 
     * @returns {HRESULT} 
     */
    IsManagedModule(Index, Base) {
        result := ComCall(92, this, UInt32, Index, Int64, Base, "HRESULT")
        return result
    }

    /**
     * @param {PSTR} Name 
     * @param {Integer} StartIndex 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} Index 
     * @param {Pointer<Integer>} Base 
     * @returns {HRESULT} 
     */
    GetModuleByModuleName2(Name, StartIndex, Flags, Index, Base) {
        Name := Name is String ? StrPtr(Name) : Name

        IndexMarshal := Index is VarRef ? "uint*" : IntPtr
        IndexMarshal := Index == 0 ? IntPtr : "uint*"
        BaseMarshal := Base is VarRef ? "uint*" : IntPtr
        BaseMarshal := Base == 0 ? IntPtr : "uint*"

        result := ComCall(93, this, "ptr", Name, UInt32, StartIndex, UInt32, Flags, IndexMarshal, Index, BaseMarshal, Base, "HRESULT")
        return result
    }

    /**
     * @param {PWSTR} Name 
     * @param {Integer} StartIndex 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} Index 
     * @param {Pointer<Integer>} Base 
     * @returns {HRESULT} 
     */
    GetModuleByModuleName2Wide(Name, StartIndex, Flags, Index, Base) {
        Name := Name is String ? StrPtr(Name) : Name

        IndexMarshal := Index is VarRef ? "uint*" : IntPtr
        IndexMarshal := Index == 0 ? IntPtr : "uint*"
        BaseMarshal := Base is VarRef ? "uint*" : IntPtr
        BaseMarshal := Base == 0 ? IntPtr : "uint*"

        result := ComCall(94, this, "ptr", Name, UInt32, StartIndex, UInt32, Flags, IndexMarshal, Index, BaseMarshal, Base, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Offset 
     * @param {Integer} StartIndex 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} Index 
     * @param {Pointer<Integer>} Base 
     * @returns {HRESULT} 
     */
    GetModuleByOffset2(Offset, StartIndex, Flags, Index, Base) {
        IndexMarshal := Index is VarRef ? "uint*" : IntPtr
        IndexMarshal := Index == 0 ? IntPtr : "uint*"
        BaseMarshal := Base is VarRef ? "uint*" : IntPtr
        BaseMarshal := Base == 0 ? IntPtr : "uint*"

        result := ComCall(95, this, Int64, Offset, UInt32, StartIndex, UInt32, Flags, IndexMarshal, Index, BaseMarshal, Base, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Base 
     * @param {Integer} _Size 
     * @param {PSTR} ImagePath 
     * @param {PSTR} ModuleName 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    AddSyntheticModule(Base, _Size, ImagePath, ModuleName, Flags) {
        ImagePath := ImagePath is String ? StrPtr(ImagePath) : ImagePath
        ModuleName := ModuleName is String ? StrPtr(ModuleName) : ModuleName

        result := ComCall(96, this, Int64, Base, UInt32, _Size, "ptr", ImagePath, "ptr", ModuleName, UInt32, Flags, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Base 
     * @param {Integer} _Size 
     * @param {PWSTR} ImagePath 
     * @param {PWSTR} ModuleName 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    AddSyntheticModuleWide(Base, _Size, ImagePath, ModuleName, Flags) {
        ImagePath := ImagePath is String ? StrPtr(ImagePath) : ImagePath
        ModuleName := ModuleName is String ? StrPtr(ModuleName) : ModuleName

        result := ComCall(97, this, Int64, Base, UInt32, _Size, "ptr", ImagePath, "ptr", ModuleName, UInt32, Flags, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Base 
     * @returns {HRESULT} 
     */
    RemoveSyntheticModule(Base) {
        result := ComCall(98, this, Int64, Base, "HRESULT")
        return result
    }

    /**
     * @returns {Integer} 
     */
    GetCurrentScopeFrameIndex() {
        result := ComCall(99, this, "uint*", &Index := 0, "HRESULT")
        return Index
    }

    /**
     * @param {Integer} Index 
     * @returns {HRESULT} 
     */
    SetScopeFrameByIndex(Index) {
        result := ComCall(100, this, UInt32, Index, "HRESULT")
        return result
    }

    /**
     * @param {Integer} OutputControl 
     * @param {Integer} InfoOffset 
     * @returns {HRESULT} 
     */
    SetScopeFromJitDebugInfo(OutputControl, InfoOffset) {
        result := ComCall(101, this, UInt32, OutputControl, Int64, InfoOffset, "HRESULT")
        return result
    }

    /**
     * @returns {HRESULT} 
     */
    SetScopeFromStoredEvent() {
        result := ComCall(102, this, "HRESULT")
        return result
    }

    /**
     * @param {Integer} OutputControl 
     * @param {Integer} Flags 
     * @param {Integer} Offset 
     * @returns {HRESULT} 
     */
    OutputSymbolByOffset(OutputControl, Flags, Offset) {
        result := ComCall(103, this, UInt32, OutputControl, UInt32, Flags, Int64, Offset, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Offset 
     * @param {Integer} Flags 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetFunctionEntryByOffset(Offset, Flags, _Buffer, BufferSize) {
        _BufferMarshal := _Buffer == 0 ? IntPtr : IntPtr

        result := ComCall(104, this, Int64, Offset, UInt32, Flags, _BufferMarshal, _Buffer, UInt32, BufferSize, "uint*", &BufferNeeded := 0, "HRESULT")
        return BufferNeeded
    }

    /**
     * @param {Integer} Module 
     * @param {Integer} ContainerTypeId 
     * @param {PSTR} Field 
     * @param {Pointer<Integer>} FieldTypeId 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetFieldTypeAndOffset(Module, ContainerTypeId, Field, FieldTypeId, Offset) {
        Field := Field is String ? StrPtr(Field) : Field

        FieldTypeIdMarshal := FieldTypeId is VarRef ? "uint*" : IntPtr
        FieldTypeIdMarshal := FieldTypeId == 0 ? IntPtr : "uint*"
        OffsetMarshal := Offset is VarRef ? "uint*" : IntPtr
        OffsetMarshal := Offset == 0 ? IntPtr : "uint*"

        result := ComCall(105, this, Int64, Module, UInt32, ContainerTypeId, "ptr", Field, FieldTypeIdMarshal, FieldTypeId, OffsetMarshal, Offset, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Module 
     * @param {Integer} ContainerTypeId 
     * @param {PWSTR} Field 
     * @param {Pointer<Integer>} FieldTypeId 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetFieldTypeAndOffsetWide(Module, ContainerTypeId, Field, FieldTypeId, Offset) {
        Field := Field is String ? StrPtr(Field) : Field

        FieldTypeIdMarshal := FieldTypeId is VarRef ? "uint*" : IntPtr
        FieldTypeIdMarshal := FieldTypeId == 0 ? IntPtr : "uint*"
        OffsetMarshal := Offset is VarRef ? "uint*" : IntPtr
        OffsetMarshal := Offset == 0 ? IntPtr : "uint*"

        result := ComCall(106, this, Int64, Module, UInt32, ContainerTypeId, "ptr", Field, FieldTypeIdMarshal, FieldTypeId, OffsetMarshal, Offset, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Offset 
     * @param {Integer} _Size 
     * @param {PSTR} Name 
     * @param {Integer} Flags 
     * @returns {DEBUG_MODULE_AND_ID} 
     */
    AddSyntheticSymbol(Offset, _Size, Name, Flags) {
        Name := Name is String ? StrPtr(Name) : Name

        Id := DEBUG_MODULE_AND_ID()
        result := ComCall(107, this, Int64, Offset, UInt32, _Size, "ptr", Name, UInt32, Flags, DEBUG_MODULE_AND_ID.Ptr, Id, "HRESULT")
        return Id
    }

    /**
     * @param {Integer} Offset 
     * @param {Integer} _Size 
     * @param {PWSTR} Name 
     * @param {Integer} Flags 
     * @returns {DEBUG_MODULE_AND_ID} 
     */
    AddSyntheticSymbolWide(Offset, _Size, Name, Flags) {
        Name := Name is String ? StrPtr(Name) : Name

        Id := DEBUG_MODULE_AND_ID()
        result := ComCall(108, this, Int64, Offset, UInt32, _Size, "ptr", Name, UInt32, Flags, DEBUG_MODULE_AND_ID.Ptr, Id, "HRESULT")
        return Id
    }

    /**
     * @param {Pointer<DEBUG_MODULE_AND_ID>} Id 
     * @returns {HRESULT} 
     */
    RemoveSyntheticSymbol(Id) {
        result := ComCall(109, this, DEBUG_MODULE_AND_ID.Ptr, Id, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Offset 
     * @param {Integer} Flags 
     * @param {Pointer<DEBUG_MODULE_AND_ID>} Ids 
     * @param {Pointer<Integer>} Displacements 
     * @param {Integer} IdsCount 
     * @param {Pointer<Integer>} Entries 
     * @returns {HRESULT} 
     */
    GetSymbolEntriesByOffset(Offset, Flags, Ids, Displacements, IdsCount, Entries) {
        IdsMarshal := Ids == 0 ? IntPtr : DEBUG_MODULE_AND_ID.Ptr
        DisplacementsMarshal := Displacements is VarRef ? "uint*" : IntPtr
        DisplacementsMarshal := Displacements == 0 ? IntPtr : "uint*"
        EntriesMarshal := Entries is VarRef ? "uint*" : IntPtr
        EntriesMarshal := Entries == 0 ? IntPtr : "uint*"

        result := ComCall(110, this, Int64, Offset, UInt32, Flags, IdsMarshal, Ids, DisplacementsMarshal, Displacements, UInt32, IdsCount, EntriesMarshal, Entries, "HRESULT")
        return result
    }

    /**
     * @param {PSTR} Symbol 
     * @param {Integer} Flags 
     * @param {Pointer<DEBUG_MODULE_AND_ID>} Ids 
     * @param {Integer} IdsCount 
     * @param {Pointer<Integer>} Entries 
     * @returns {HRESULT} 
     */
    GetSymbolEntriesByName(Symbol, Flags, Ids, IdsCount, Entries) {
        Symbol := Symbol is String ? StrPtr(Symbol) : Symbol

        IdsMarshal := Ids == 0 ? IntPtr : DEBUG_MODULE_AND_ID.Ptr
        EntriesMarshal := Entries is VarRef ? "uint*" : IntPtr
        EntriesMarshal := Entries == 0 ? IntPtr : "uint*"

        result := ComCall(111, this, "ptr", Symbol, UInt32, Flags, IdsMarshal, Ids, UInt32, IdsCount, EntriesMarshal, Entries, "HRESULT")
        return result
    }

    /**
     * @param {PWSTR} Symbol 
     * @param {Integer} Flags 
     * @param {Pointer<DEBUG_MODULE_AND_ID>} Ids 
     * @param {Integer} IdsCount 
     * @param {Pointer<Integer>} Entries 
     * @returns {HRESULT} 
     */
    GetSymbolEntriesByNameWide(Symbol, Flags, Ids, IdsCount, Entries) {
        Symbol := Symbol is String ? StrPtr(Symbol) : Symbol

        IdsMarshal := Ids == 0 ? IntPtr : DEBUG_MODULE_AND_ID.Ptr
        EntriesMarshal := Entries is VarRef ? "uint*" : IntPtr
        EntriesMarshal := Entries == 0 ? IntPtr : "uint*"

        result := ComCall(112, this, "ptr", Symbol, UInt32, Flags, IdsMarshal, Ids, UInt32, IdsCount, EntriesMarshal, Entries, "HRESULT")
        return result
    }

    /**
     * @param {Integer} ModuleBase 
     * @param {Integer} Token 
     * @returns {DEBUG_MODULE_AND_ID} 
     */
    GetSymbolEntryByToken(ModuleBase, Token) {
        Id := DEBUG_MODULE_AND_ID()
        result := ComCall(113, this, Int64, ModuleBase, UInt32, Token, DEBUG_MODULE_AND_ID.Ptr, Id, "HRESULT")
        return Id
    }

    /**
     * @param {Pointer<DEBUG_MODULE_AND_ID>} Id 
     * @returns {DEBUG_SYMBOL_ENTRY} 
     */
    GetSymbolEntryInformation(Id) {
        Info := DEBUG_SYMBOL_ENTRY()
        result := ComCall(114, this, DEBUG_MODULE_AND_ID.Ptr, Id, DEBUG_SYMBOL_ENTRY.Ptr, Info, "HRESULT")
        return Info
    }

    /**
     * @param {Pointer<DEBUG_MODULE_AND_ID>} Id 
     * @param {Integer} Which 
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSymbolEntryString(Id, Which, _Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        _BufferMarshal := _Buffer == 0 ? IntPtr : PSTR

        result := ComCall(115, this, DEBUG_MODULE_AND_ID.Ptr, Id, UInt32, Which, _BufferMarshal, _Buffer, UInt32, BufferSize, "uint*", &StringSize := 0, "HRESULT")
        return StringSize
    }

    /**
     * @param {Pointer<DEBUG_MODULE_AND_ID>} Id 
     * @param {Integer} Which 
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSymbolEntryStringWide(Id, Which, _Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        _BufferMarshal := _Buffer == 0 ? IntPtr : PWSTR

        result := ComCall(116, this, DEBUG_MODULE_AND_ID.Ptr, Id, UInt32, Which, _BufferMarshal, _Buffer, UInt32, BufferSize, "uint*", &StringSize := 0, "HRESULT")
        return StringSize
    }

    /**
     * @param {Pointer<DEBUG_MODULE_AND_ID>} Id 
     * @param {Integer} Flags 
     * @param {Pointer<DEBUG_OFFSET_REGION>} Regions 
     * @param {Integer} RegionsCount 
     * @param {Pointer<Integer>} RegionsAvail 
     * @returns {HRESULT} 
     */
    GetSymbolEntryOffsetRegions(Id, Flags, Regions, RegionsCount, RegionsAvail) {
        RegionsMarshal := Regions == 0 ? IntPtr : DEBUG_OFFSET_REGION.Ptr
        RegionsAvailMarshal := RegionsAvail is VarRef ? "uint*" : IntPtr
        RegionsAvailMarshal := RegionsAvail == 0 ? IntPtr : "uint*"

        result := ComCall(117, this, DEBUG_MODULE_AND_ID.Ptr, Id, UInt32, Flags, RegionsMarshal, Regions, UInt32, RegionsCount, RegionsAvailMarshal, RegionsAvail, "HRESULT")
        return result
    }

    /**
     * @param {Pointer<DEBUG_MODULE_AND_ID>} FromId 
     * @param {Integer} Flags 
     * @returns {DEBUG_MODULE_AND_ID} 
     */
    GetSymbolEntryBySymbolEntry(FromId, Flags) {
        ToId := DEBUG_MODULE_AND_ID()
        result := ComCall(118, this, DEBUG_MODULE_AND_ID.Ptr, FromId, UInt32, Flags, DEBUG_MODULE_AND_ID.Ptr, ToId, "HRESULT")
        return ToId
    }

    /**
     * @param {Integer} Offset 
     * @param {Integer} Flags 
     * @param {Pointer<DEBUG_SYMBOL_SOURCE_ENTRY>} Entries 
     * @param {Integer} EntriesCount 
     * @param {Pointer<Integer>} EntriesAvail 
     * @returns {HRESULT} 
     */
    GetSourceEntriesByOffset(Offset, Flags, Entries, EntriesCount, EntriesAvail) {
        EntriesMarshal := Entries == 0 ? IntPtr : DEBUG_SYMBOL_SOURCE_ENTRY.Ptr
        EntriesAvailMarshal := EntriesAvail is VarRef ? "uint*" : IntPtr
        EntriesAvailMarshal := EntriesAvail == 0 ? IntPtr : "uint*"

        result := ComCall(119, this, Int64, Offset, UInt32, Flags, EntriesMarshal, Entries, UInt32, EntriesCount, EntriesAvailMarshal, EntriesAvail, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Line 
     * @param {PSTR} _File 
     * @param {Integer} Flags 
     * @param {Pointer<DEBUG_SYMBOL_SOURCE_ENTRY>} Entries 
     * @param {Integer} EntriesCount 
     * @param {Pointer<Integer>} EntriesAvail 
     * @returns {HRESULT} 
     */
    GetSourceEntriesByLine(Line, _File, Flags, Entries, EntriesCount, EntriesAvail) {
        _File := _File is String ? StrPtr(_File) : _File

        EntriesMarshal := Entries == 0 ? IntPtr : DEBUG_SYMBOL_SOURCE_ENTRY.Ptr
        EntriesAvailMarshal := EntriesAvail is VarRef ? "uint*" : IntPtr
        EntriesAvailMarshal := EntriesAvail == 0 ? IntPtr : "uint*"

        result := ComCall(120, this, UInt32, Line, "ptr", _File, UInt32, Flags, EntriesMarshal, Entries, UInt32, EntriesCount, EntriesAvailMarshal, EntriesAvail, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Line 
     * @param {PWSTR} _File 
     * @param {Integer} Flags 
     * @param {Pointer<DEBUG_SYMBOL_SOURCE_ENTRY>} Entries 
     * @param {Integer} EntriesCount 
     * @param {Pointer<Integer>} EntriesAvail 
     * @returns {HRESULT} 
     */
    GetSourceEntriesByLineWide(Line, _File, Flags, Entries, EntriesCount, EntriesAvail) {
        _File := _File is String ? StrPtr(_File) : _File

        EntriesMarshal := Entries == 0 ? IntPtr : DEBUG_SYMBOL_SOURCE_ENTRY.Ptr
        EntriesAvailMarshal := EntriesAvail is VarRef ? "uint*" : IntPtr
        EntriesAvailMarshal := EntriesAvail == 0 ? IntPtr : "uint*"

        result := ComCall(121, this, UInt32, Line, "ptr", _File, UInt32, Flags, EntriesMarshal, Entries, UInt32, EntriesCount, EntriesAvailMarshal, EntriesAvail, "HRESULT")
        return result
    }

    /**
     * @param {Pointer<DEBUG_SYMBOL_SOURCE_ENTRY>} Entry 
     * @param {Integer} Which 
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSourceEntryString(Entry, Which, _Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        _BufferMarshal := _Buffer == 0 ? IntPtr : PSTR

        result := ComCall(122, this, DEBUG_SYMBOL_SOURCE_ENTRY.Ptr, Entry, UInt32, Which, _BufferMarshal, _Buffer, UInt32, BufferSize, "uint*", &StringSize := 0, "HRESULT")
        return StringSize
    }

    /**
     * @param {Pointer<DEBUG_SYMBOL_SOURCE_ENTRY>} Entry 
     * @param {Integer} Which 
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSourceEntryStringWide(Entry, Which, _Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        _BufferMarshal := _Buffer == 0 ? IntPtr : PWSTR

        result := ComCall(123, this, DEBUG_SYMBOL_SOURCE_ENTRY.Ptr, Entry, UInt32, Which, _BufferMarshal, _Buffer, UInt32, BufferSize, "uint*", &StringSize := 0, "HRESULT")
        return StringSize
    }

    /**
     * @param {Pointer<DEBUG_SYMBOL_SOURCE_ENTRY>} Entry 
     * @param {Integer} Flags 
     * @param {Pointer<DEBUG_OFFSET_REGION>} Regions 
     * @param {Integer} RegionsCount 
     * @param {Pointer<Integer>} RegionsAvail 
     * @returns {HRESULT} 
     */
    GetSourceEntryOffsetRegions(Entry, Flags, Regions, RegionsCount, RegionsAvail) {
        RegionsMarshal := Regions == 0 ? IntPtr : DEBUG_OFFSET_REGION.Ptr
        RegionsAvailMarshal := RegionsAvail is VarRef ? "uint*" : IntPtr
        RegionsAvailMarshal := RegionsAvail == 0 ? IntPtr : "uint*"

        result := ComCall(124, this, DEBUG_SYMBOL_SOURCE_ENTRY.Ptr, Entry, UInt32, Flags, RegionsMarshal, Regions, UInt32, RegionsCount, RegionsAvailMarshal, RegionsAvail, "HRESULT")
        return result
    }

    /**
     * @param {Pointer<DEBUG_SYMBOL_SOURCE_ENTRY>} FromEntry 
     * @param {Integer} Flags 
     * @returns {DEBUG_SYMBOL_SOURCE_ENTRY} 
     */
    GetSourceEntryBySourceEntry(FromEntry, Flags) {
        ToEntry := DEBUG_SYMBOL_SOURCE_ENTRY()
        result := ComCall(125, this, DEBUG_SYMBOL_SOURCE_ENTRY.Ptr, FromEntry, UInt32, Flags, DEBUG_SYMBOL_SOURCE_ENTRY.Ptr, ToEntry, "HRESULT")
        return ToEntry
    }

    /**
     * @param {Pointer<Integer>} InstructionOffset 
     * @param {Pointer<DEBUG_STACK_FRAME_EX>} ScopeFrame 
     * @param {Integer} ScopeContext 
     * @param {Integer} ScopeContextSize 
     * @returns {HRESULT} 
     */
    GetScopeEx(InstructionOffset, ScopeFrame, ScopeContext, ScopeContextSize) {
        InstructionOffsetMarshal := InstructionOffset is VarRef ? "uint*" : IntPtr
        InstructionOffsetMarshal := InstructionOffset == 0 ? IntPtr : "uint*"
        ScopeFrameMarshal := ScopeFrame == 0 ? IntPtr : DEBUG_STACK_FRAME_EX.Ptr
        ScopeContextMarshal := ScopeContext == 0 ? IntPtr : IntPtr

        result := ComCall(126, this, InstructionOffsetMarshal, InstructionOffset, ScopeFrameMarshal, ScopeFrame, ScopeContextMarshal, ScopeContext, UInt32, ScopeContextSize, "HRESULT")
        return result
    }

    /**
     * @param {Integer} InstructionOffset 
     * @param {Pointer<DEBUG_STACK_FRAME_EX>} ScopeFrame 
     * @param {Integer} ScopeContext 
     * @param {Integer} ScopeContextSize 
     * @returns {HRESULT} 
     */
    SetScopeEx(InstructionOffset, ScopeFrame, ScopeContext, ScopeContextSize) {
        ScopeFrameMarshal := ScopeFrame == 0 ? IntPtr : DEBUG_STACK_FRAME_EX.Ptr
        ScopeContextMarshal := ScopeContext == 0 ? IntPtr : IntPtr

        result := ComCall(127, this, Int64, InstructionOffset, ScopeFrameMarshal, ScopeFrame, ScopeContextMarshal, ScopeContext, UInt32, ScopeContextSize, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Offset 
     * @param {Integer} InlineContext 
     * @param {PSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @param {Pointer<Integer>} Displacement 
     * @returns {HRESULT} 
     */
    GetNameByInlineContext(Offset, InlineContext, NameBuffer, NameBufferSize, NameSize, Displacement) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        NameBufferMarshal := NameBuffer == 0 ? IntPtr : PSTR
        NameSizeMarshal := NameSize is VarRef ? "uint*" : IntPtr
        NameSizeMarshal := NameSize == 0 ? IntPtr : "uint*"
        DisplacementMarshal := Displacement is VarRef ? "uint*" : IntPtr
        DisplacementMarshal := Displacement == 0 ? IntPtr : "uint*"

        result := ComCall(128, this, Int64, Offset, UInt32, InlineContext, NameBufferMarshal, NameBuffer, UInt32, NameBufferSize, NameSizeMarshal, NameSize, DisplacementMarshal, Displacement, "HRESULT")
        return result
    }

    /**
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

        NameBufferMarshal := NameBuffer == 0 ? IntPtr : PWSTR
        NameSizeMarshal := NameSize is VarRef ? "uint*" : IntPtr
        NameSizeMarshal := NameSize == 0 ? IntPtr : "uint*"
        DisplacementMarshal := Displacement is VarRef ? "uint*" : IntPtr
        DisplacementMarshal := Displacement == 0 ? IntPtr : "uint*"

        result := ComCall(129, this, Int64, Offset, UInt32, InlineContext, NameBufferMarshal, NameBuffer, UInt32, NameBufferSize, NameSizeMarshal, NameSize, DisplacementMarshal, Displacement, "HRESULT")
        return result
    }

    /**
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
        FileBuffer := FileBuffer is String ? StrPtr(FileBuffer) : FileBuffer

        LineMarshal := Line is VarRef ? "uint*" : IntPtr
        LineMarshal := Line == 0 ? IntPtr : "uint*"
        FileBufferMarshal := FileBuffer == 0 ? IntPtr : PSTR
        FileSizeMarshal := FileSize is VarRef ? "uint*" : IntPtr
        FileSizeMarshal := FileSize == 0 ? IntPtr : "uint*"
        DisplacementMarshal := Displacement is VarRef ? "uint*" : IntPtr
        DisplacementMarshal := Displacement == 0 ? IntPtr : "uint*"

        result := ComCall(130, this, Int64, Offset, UInt32, InlineContext, LineMarshal, Line, FileBufferMarshal, FileBuffer, UInt32, FileBufferSize, FileSizeMarshal, FileSize, DisplacementMarshal, Displacement, "HRESULT")
        return result
    }

    /**
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

        LineMarshal := Line is VarRef ? "uint*" : IntPtr
        LineMarshal := Line == 0 ? IntPtr : "uint*"
        FileBufferMarshal := FileBuffer == 0 ? IntPtr : PWSTR
        FileSizeMarshal := FileSize is VarRef ? "uint*" : IntPtr
        FileSizeMarshal := FileSize == 0 ? IntPtr : "uint*"
        DisplacementMarshal := Displacement is VarRef ? "uint*" : IntPtr
        DisplacementMarshal := Displacement == 0 ? IntPtr : "uint*"

        result := ComCall(131, this, Int64, Offset, UInt32, InlineContext, LineMarshal, Line, FileBufferMarshal, FileBuffer, UInt32, FileBufferSize, FileSizeMarshal, FileSize, DisplacementMarshal, Displacement, "HRESULT")
        return result
    }

    /**
     * @param {Integer} OutputControl 
     * @param {Integer} Flags 
     * @param {Integer} Offset 
     * @param {Integer} InlineContext 
     * @returns {HRESULT} 
     */
    OutputSymbolByInlineContext(OutputControl, Flags, Offset, InlineContext) {
        result := ComCall(132, this, UInt32, OutputControl, UInt32, Flags, Int64, Offset, UInt32, InlineContext, "HRESULT")
        return result
    }

    _Query(iid) {
        if (IDebugSymbols4.IID.Equals(iid)) {
            return true
        }
        return super._Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSymbolOptions := CallbackCreate(ObjBindMethod(implObj, "GetSymbolOptions"), flags, 2)
        this.vtbl.AddSymbolOptions := CallbackCreate(ObjBindMethod(implObj, "AddSymbolOptions"), flags, 2)
        this.vtbl.RemoveSymbolOptions := CallbackCreate(ObjBindMethod(implObj, "RemoveSymbolOptions"), flags, 2)
        this.vtbl.SetSymbolOptions := CallbackCreate(ObjBindMethod(implObj, "SetSymbolOptions"), flags, 2)
        this.vtbl.GetNameByOffset := CallbackCreate(ObjBindMethod(implObj, "GetNameByOffset"), flags, 6)
        this.vtbl.GetOffsetByName := CallbackCreate(ObjBindMethod(implObj, "GetOffsetByName"), flags, 3)
        this.vtbl.GetNearNameByOffset := CallbackCreate(ObjBindMethod(implObj, "GetNearNameByOffset"), flags, 7)
        this.vtbl.GetLineByOffset := CallbackCreate(ObjBindMethod(implObj, "GetLineByOffset"), flags, 7)
        this.vtbl.GetOffsetByLine := CallbackCreate(ObjBindMethod(implObj, "GetOffsetByLine"), flags, 4)
        this.vtbl.GetNumberModules := CallbackCreate(ObjBindMethod(implObj, "GetNumberModules"), flags, 3)
        this.vtbl.GetModuleByIndex := CallbackCreate(ObjBindMethod(implObj, "GetModuleByIndex"), flags, 3)
        this.vtbl.GetModuleByModuleName := CallbackCreate(ObjBindMethod(implObj, "GetModuleByModuleName"), flags, 5)
        this.vtbl.GetModuleByOffset := CallbackCreate(ObjBindMethod(implObj, "GetModuleByOffset"), flags, 5)
        this.vtbl.GetModuleNames := CallbackCreate(ObjBindMethod(implObj, "GetModuleNames"), flags, 12)
        this.vtbl.GetModuleParameters := CallbackCreate(ObjBindMethod(implObj, "GetModuleParameters"), flags, 5)
        this.vtbl.GetSymbolModule := CallbackCreate(ObjBindMethod(implObj, "GetSymbolModule"), flags, 3)
        this.vtbl.GetTypeName := CallbackCreate(ObjBindMethod(implObj, "GetTypeName"), flags, 6)
        this.vtbl.GetTypeId := CallbackCreate(ObjBindMethod(implObj, "GetTypeId"), flags, 4)
        this.vtbl.GetTypeSize := CallbackCreate(ObjBindMethod(implObj, "GetTypeSize"), flags, 4)
        this.vtbl.GetFieldOffset := CallbackCreate(ObjBindMethod(implObj, "GetFieldOffset"), flags, 5)
        this.vtbl.GetSymbolTypeId := CallbackCreate(ObjBindMethod(implObj, "GetSymbolTypeId"), flags, 4)
        this.vtbl.GetOffsetTypeId := CallbackCreate(ObjBindMethod(implObj, "GetOffsetTypeId"), flags, 4)
        this.vtbl.ReadTypedDataVirtual := CallbackCreate(ObjBindMethod(implObj, "ReadTypedDataVirtual"), flags, 7)
        this.vtbl.WriteTypedDataVirtual := CallbackCreate(ObjBindMethod(implObj, "WriteTypedDataVirtual"), flags, 7)
        this.vtbl.OutputTypedDataVirtual := CallbackCreate(ObjBindMethod(implObj, "OutputTypedDataVirtual"), flags, 6)
        this.vtbl.ReadTypedDataPhysical := CallbackCreate(ObjBindMethod(implObj, "ReadTypedDataPhysical"), flags, 7)
        this.vtbl.WriteTypedDataPhysical := CallbackCreate(ObjBindMethod(implObj, "WriteTypedDataPhysical"), flags, 7)
        this.vtbl.OutputTypedDataPhysical := CallbackCreate(ObjBindMethod(implObj, "OutputTypedDataPhysical"), flags, 6)
        this.vtbl.GetScope := CallbackCreate(ObjBindMethod(implObj, "GetScope"), flags, 5)
        this.vtbl.SetScope := CallbackCreate(ObjBindMethod(implObj, "SetScope"), flags, 5)
        this.vtbl.ResetScope := CallbackCreate(ObjBindMethod(implObj, "ResetScope"), flags, 1)
        this.vtbl.GetScopeSymbolGroup := CallbackCreate(ObjBindMethod(implObj, "GetScopeSymbolGroup"), flags, 4)
        this.vtbl.CreateSymbolGroup := CallbackCreate(ObjBindMethod(implObj, "CreateSymbolGroup"), flags, 2)
        this.vtbl.StartSymbolMatch := CallbackCreate(ObjBindMethod(implObj, "StartSymbolMatch"), flags, 3)
        this.vtbl.GetNextSymbolMatch := CallbackCreate(ObjBindMethod(implObj, "GetNextSymbolMatch"), flags, 6)
        this.vtbl.EndSymbolMatch := CallbackCreate(ObjBindMethod(implObj, "EndSymbolMatch"), flags, 2)
        this.vtbl.Reload := CallbackCreate(ObjBindMethod(implObj, "Reload"), flags, 2)
        this.vtbl.GetSymbolPath := CallbackCreate(ObjBindMethod(implObj, "GetSymbolPath"), flags, 4)
        this.vtbl.SetSymbolPath := CallbackCreate(ObjBindMethod(implObj, "SetSymbolPath"), flags, 2)
        this.vtbl.AppendSymbolPath := CallbackCreate(ObjBindMethod(implObj, "AppendSymbolPath"), flags, 2)
        this.vtbl.GetImagePath := CallbackCreate(ObjBindMethod(implObj, "GetImagePath"), flags, 4)
        this.vtbl.SetImagePath := CallbackCreate(ObjBindMethod(implObj, "SetImagePath"), flags, 2)
        this.vtbl.AppendImagePath := CallbackCreate(ObjBindMethod(implObj, "AppendImagePath"), flags, 2)
        this.vtbl.GetSourcePath := CallbackCreate(ObjBindMethod(implObj, "GetSourcePath"), flags, 4)
        this.vtbl.GetSourcePathElement := CallbackCreate(ObjBindMethod(implObj, "GetSourcePathElement"), flags, 5)
        this.vtbl.SetSourcePath := CallbackCreate(ObjBindMethod(implObj, "SetSourcePath"), flags, 2)
        this.vtbl.AppendSourcePath := CallbackCreate(ObjBindMethod(implObj, "AppendSourcePath"), flags, 2)
        this.vtbl.FindSourceFile := CallbackCreate(ObjBindMethod(implObj, "FindSourceFile"), flags, 8)
        this.vtbl.GetSourceFileLineOffsets := CallbackCreate(ObjBindMethod(implObj, "GetSourceFileLineOffsets"), flags, 5)
        this.vtbl.GetModuleVersionInformation := CallbackCreate(ObjBindMethod(implObj, "GetModuleVersionInformation"), flags, 7)
        this.vtbl.GetModuleNameString := CallbackCreate(ObjBindMethod(implObj, "GetModuleNameString"), flags, 7)
        this.vtbl.GetConstantName := CallbackCreate(ObjBindMethod(implObj, "GetConstantName"), flags, 7)
        this.vtbl.GetFieldName := CallbackCreate(ObjBindMethod(implObj, "GetFieldName"), flags, 7)
        this.vtbl.GetTypeOptions := CallbackCreate(ObjBindMethod(implObj, "GetTypeOptions"), flags, 2)
        this.vtbl.AddTypeOptions := CallbackCreate(ObjBindMethod(implObj, "AddTypeOptions"), flags, 2)
        this.vtbl.RemoveTypeOptions := CallbackCreate(ObjBindMethod(implObj, "RemoveTypeOptions"), flags, 2)
        this.vtbl.SetTypeOptions := CallbackCreate(ObjBindMethod(implObj, "SetTypeOptions"), flags, 2)
        this.vtbl.GetNameByOffsetWide := CallbackCreate(ObjBindMethod(implObj, "GetNameByOffsetWide"), flags, 6)
        this.vtbl.GetOffsetByNameWide := CallbackCreate(ObjBindMethod(implObj, "GetOffsetByNameWide"), flags, 3)
        this.vtbl.GetNearNameByOffsetWide := CallbackCreate(ObjBindMethod(implObj, "GetNearNameByOffsetWide"), flags, 7)
        this.vtbl.GetLineByOffsetWide := CallbackCreate(ObjBindMethod(implObj, "GetLineByOffsetWide"), flags, 7)
        this.vtbl.GetOffsetByLineWide := CallbackCreate(ObjBindMethod(implObj, "GetOffsetByLineWide"), flags, 4)
        this.vtbl.GetModuleByModuleNameWide := CallbackCreate(ObjBindMethod(implObj, "GetModuleByModuleNameWide"), flags, 5)
        this.vtbl.GetSymbolModuleWide := CallbackCreate(ObjBindMethod(implObj, "GetSymbolModuleWide"), flags, 3)
        this.vtbl.GetTypeNameWide := CallbackCreate(ObjBindMethod(implObj, "GetTypeNameWide"), flags, 6)
        this.vtbl.GetTypeIdWide := CallbackCreate(ObjBindMethod(implObj, "GetTypeIdWide"), flags, 4)
        this.vtbl.GetFieldOffsetWide := CallbackCreate(ObjBindMethod(implObj, "GetFieldOffsetWide"), flags, 5)
        this.vtbl.GetSymbolTypeIdWide := CallbackCreate(ObjBindMethod(implObj, "GetSymbolTypeIdWide"), flags, 4)
        this.vtbl.GetScopeSymbolGroup2 := CallbackCreate(ObjBindMethod(implObj, "GetScopeSymbolGroup2"), flags, 4)
        this.vtbl.CreateSymbolGroup2 := CallbackCreate(ObjBindMethod(implObj, "CreateSymbolGroup2"), flags, 2)
        this.vtbl.StartSymbolMatchWide := CallbackCreate(ObjBindMethod(implObj, "StartSymbolMatchWide"), flags, 3)
        this.vtbl.GetNextSymbolMatchWide := CallbackCreate(ObjBindMethod(implObj, "GetNextSymbolMatchWide"), flags, 6)
        this.vtbl.ReloadWide := CallbackCreate(ObjBindMethod(implObj, "ReloadWide"), flags, 2)
        this.vtbl.GetSymbolPathWide := CallbackCreate(ObjBindMethod(implObj, "GetSymbolPathWide"), flags, 4)
        this.vtbl.SetSymbolPathWide := CallbackCreate(ObjBindMethod(implObj, "SetSymbolPathWide"), flags, 2)
        this.vtbl.AppendSymbolPathWide := CallbackCreate(ObjBindMethod(implObj, "AppendSymbolPathWide"), flags, 2)
        this.vtbl.GetImagePathWide := CallbackCreate(ObjBindMethod(implObj, "GetImagePathWide"), flags, 4)
        this.vtbl.SetImagePathWide := CallbackCreate(ObjBindMethod(implObj, "SetImagePathWide"), flags, 2)
        this.vtbl.AppendImagePathWide := CallbackCreate(ObjBindMethod(implObj, "AppendImagePathWide"), flags, 2)
        this.vtbl.GetSourcePathWide := CallbackCreate(ObjBindMethod(implObj, "GetSourcePathWide"), flags, 4)
        this.vtbl.GetSourcePathElementWide := CallbackCreate(ObjBindMethod(implObj, "GetSourcePathElementWide"), flags, 5)
        this.vtbl.SetSourcePathWide := CallbackCreate(ObjBindMethod(implObj, "SetSourcePathWide"), flags, 2)
        this.vtbl.AppendSourcePathWide := CallbackCreate(ObjBindMethod(implObj, "AppendSourcePathWide"), flags, 2)
        this.vtbl.FindSourceFileWide := CallbackCreate(ObjBindMethod(implObj, "FindSourceFileWide"), flags, 8)
        this.vtbl.GetSourceFileLineOffsetsWide := CallbackCreate(ObjBindMethod(implObj, "GetSourceFileLineOffsetsWide"), flags, 5)
        this.vtbl.GetModuleVersionInformationWide := CallbackCreate(ObjBindMethod(implObj, "GetModuleVersionInformationWide"), flags, 7)
        this.vtbl.GetModuleNameStringWide := CallbackCreate(ObjBindMethod(implObj, "GetModuleNameStringWide"), flags, 7)
        this.vtbl.GetConstantNameWide := CallbackCreate(ObjBindMethod(implObj, "GetConstantNameWide"), flags, 7)
        this.vtbl.GetFieldNameWide := CallbackCreate(ObjBindMethod(implObj, "GetFieldNameWide"), flags, 7)
        this.vtbl.IsManagedModule := CallbackCreate(ObjBindMethod(implObj, "IsManagedModule"), flags, 3)
        this.vtbl.GetModuleByModuleName2 := CallbackCreate(ObjBindMethod(implObj, "GetModuleByModuleName2"), flags, 6)
        this.vtbl.GetModuleByModuleName2Wide := CallbackCreate(ObjBindMethod(implObj, "GetModuleByModuleName2Wide"), flags, 6)
        this.vtbl.GetModuleByOffset2 := CallbackCreate(ObjBindMethod(implObj, "GetModuleByOffset2"), flags, 6)
        this.vtbl.AddSyntheticModule := CallbackCreate(ObjBindMethod(implObj, "AddSyntheticModule"), flags, 6)
        this.vtbl.AddSyntheticModuleWide := CallbackCreate(ObjBindMethod(implObj, "AddSyntheticModuleWide"), flags, 6)
        this.vtbl.RemoveSyntheticModule := CallbackCreate(ObjBindMethod(implObj, "RemoveSyntheticModule"), flags, 2)
        this.vtbl.GetCurrentScopeFrameIndex := CallbackCreate(ObjBindMethod(implObj, "GetCurrentScopeFrameIndex"), flags, 2)
        this.vtbl.SetScopeFrameByIndex := CallbackCreate(ObjBindMethod(implObj, "SetScopeFrameByIndex"), flags, 2)
        this.vtbl.SetScopeFromJitDebugInfo := CallbackCreate(ObjBindMethod(implObj, "SetScopeFromJitDebugInfo"), flags, 3)
        this.vtbl.SetScopeFromStoredEvent := CallbackCreate(ObjBindMethod(implObj, "SetScopeFromStoredEvent"), flags, 1)
        this.vtbl.OutputSymbolByOffset := CallbackCreate(ObjBindMethod(implObj, "OutputSymbolByOffset"), flags, 4)
        this.vtbl.GetFunctionEntryByOffset := CallbackCreate(ObjBindMethod(implObj, "GetFunctionEntryByOffset"), flags, 6)
        this.vtbl.GetFieldTypeAndOffset := CallbackCreate(ObjBindMethod(implObj, "GetFieldTypeAndOffset"), flags, 6)
        this.vtbl.GetFieldTypeAndOffsetWide := CallbackCreate(ObjBindMethod(implObj, "GetFieldTypeAndOffsetWide"), flags, 6)
        this.vtbl.AddSyntheticSymbol := CallbackCreate(ObjBindMethod(implObj, "AddSyntheticSymbol"), flags, 6)
        this.vtbl.AddSyntheticSymbolWide := CallbackCreate(ObjBindMethod(implObj, "AddSyntheticSymbolWide"), flags, 6)
        this.vtbl.RemoveSyntheticSymbol := CallbackCreate(ObjBindMethod(implObj, "RemoveSyntheticSymbol"), flags, 2)
        this.vtbl.GetSymbolEntriesByOffset := CallbackCreate(ObjBindMethod(implObj, "GetSymbolEntriesByOffset"), flags, 7)
        this.vtbl.GetSymbolEntriesByName := CallbackCreate(ObjBindMethod(implObj, "GetSymbolEntriesByName"), flags, 6)
        this.vtbl.GetSymbolEntriesByNameWide := CallbackCreate(ObjBindMethod(implObj, "GetSymbolEntriesByNameWide"), flags, 6)
        this.vtbl.GetSymbolEntryByToken := CallbackCreate(ObjBindMethod(implObj, "GetSymbolEntryByToken"), flags, 4)
        this.vtbl.GetSymbolEntryInformation := CallbackCreate(ObjBindMethod(implObj, "GetSymbolEntryInformation"), flags, 3)
        this.vtbl.GetSymbolEntryString := CallbackCreate(ObjBindMethod(implObj, "GetSymbolEntryString"), flags, 6)
        this.vtbl.GetSymbolEntryStringWide := CallbackCreate(ObjBindMethod(implObj, "GetSymbolEntryStringWide"), flags, 6)
        this.vtbl.GetSymbolEntryOffsetRegions := CallbackCreate(ObjBindMethod(implObj, "GetSymbolEntryOffsetRegions"), flags, 6)
        this.vtbl.GetSymbolEntryBySymbolEntry := CallbackCreate(ObjBindMethod(implObj, "GetSymbolEntryBySymbolEntry"), flags, 4)
        this.vtbl.GetSourceEntriesByOffset := CallbackCreate(ObjBindMethod(implObj, "GetSourceEntriesByOffset"), flags, 6)
        this.vtbl.GetSourceEntriesByLine := CallbackCreate(ObjBindMethod(implObj, "GetSourceEntriesByLine"), flags, 7)
        this.vtbl.GetSourceEntriesByLineWide := CallbackCreate(ObjBindMethod(implObj, "GetSourceEntriesByLineWide"), flags, 7)
        this.vtbl.GetSourceEntryString := CallbackCreate(ObjBindMethod(implObj, "GetSourceEntryString"), flags, 6)
        this.vtbl.GetSourceEntryStringWide := CallbackCreate(ObjBindMethod(implObj, "GetSourceEntryStringWide"), flags, 6)
        this.vtbl.GetSourceEntryOffsetRegions := CallbackCreate(ObjBindMethod(implObj, "GetSourceEntryOffsetRegions"), flags, 6)
        this.vtbl.GetSourceEntryBySourceEntry := CallbackCreate(ObjBindMethod(implObj, "GetSourceEntryBySourceEntry"), flags, 4)
        this.vtbl.GetScopeEx := CallbackCreate(ObjBindMethod(implObj, "GetScopeEx"), flags, 5)
        this.vtbl.SetScopeEx := CallbackCreate(ObjBindMethod(implObj, "SetScopeEx"), flags, 5)
        this.vtbl.GetNameByInlineContext := CallbackCreate(ObjBindMethod(implObj, "GetNameByInlineContext"), flags, 7)
        this.vtbl.GetNameByInlineContextWide := CallbackCreate(ObjBindMethod(implObj, "GetNameByInlineContextWide"), flags, 7)
        this.vtbl.GetLineByInlineContext := CallbackCreate(ObjBindMethod(implObj, "GetLineByInlineContext"), flags, 8)
        this.vtbl.GetLineByInlineContextWide := CallbackCreate(ObjBindMethod(implObj, "GetLineByInlineContextWide"), flags, 8)
        this.vtbl.OutputSymbolByInlineContext := CallbackCreate(ObjBindMethod(implObj, "OutputSymbolByInlineContext"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSymbolOptions)
        CallbackFree(this.vtbl.AddSymbolOptions)
        CallbackFree(this.vtbl.RemoveSymbolOptions)
        CallbackFree(this.vtbl.SetSymbolOptions)
        CallbackFree(this.vtbl.GetNameByOffset)
        CallbackFree(this.vtbl.GetOffsetByName)
        CallbackFree(this.vtbl.GetNearNameByOffset)
        CallbackFree(this.vtbl.GetLineByOffset)
        CallbackFree(this.vtbl.GetOffsetByLine)
        CallbackFree(this.vtbl.GetNumberModules)
        CallbackFree(this.vtbl.GetModuleByIndex)
        CallbackFree(this.vtbl.GetModuleByModuleName)
        CallbackFree(this.vtbl.GetModuleByOffset)
        CallbackFree(this.vtbl.GetModuleNames)
        CallbackFree(this.vtbl.GetModuleParameters)
        CallbackFree(this.vtbl.GetSymbolModule)
        CallbackFree(this.vtbl.GetTypeName)
        CallbackFree(this.vtbl.GetTypeId)
        CallbackFree(this.vtbl.GetTypeSize)
        CallbackFree(this.vtbl.GetFieldOffset)
        CallbackFree(this.vtbl.GetSymbolTypeId)
        CallbackFree(this.vtbl.GetOffsetTypeId)
        CallbackFree(this.vtbl.ReadTypedDataVirtual)
        CallbackFree(this.vtbl.WriteTypedDataVirtual)
        CallbackFree(this.vtbl.OutputTypedDataVirtual)
        CallbackFree(this.vtbl.ReadTypedDataPhysical)
        CallbackFree(this.vtbl.WriteTypedDataPhysical)
        CallbackFree(this.vtbl.OutputTypedDataPhysical)
        CallbackFree(this.vtbl.GetScope)
        CallbackFree(this.vtbl.SetScope)
        CallbackFree(this.vtbl.ResetScope)
        CallbackFree(this.vtbl.GetScopeSymbolGroup)
        CallbackFree(this.vtbl.CreateSymbolGroup)
        CallbackFree(this.vtbl.StartSymbolMatch)
        CallbackFree(this.vtbl.GetNextSymbolMatch)
        CallbackFree(this.vtbl.EndSymbolMatch)
        CallbackFree(this.vtbl.Reload)
        CallbackFree(this.vtbl.GetSymbolPath)
        CallbackFree(this.vtbl.SetSymbolPath)
        CallbackFree(this.vtbl.AppendSymbolPath)
        CallbackFree(this.vtbl.GetImagePath)
        CallbackFree(this.vtbl.SetImagePath)
        CallbackFree(this.vtbl.AppendImagePath)
        CallbackFree(this.vtbl.GetSourcePath)
        CallbackFree(this.vtbl.GetSourcePathElement)
        CallbackFree(this.vtbl.SetSourcePath)
        CallbackFree(this.vtbl.AppendSourcePath)
        CallbackFree(this.vtbl.FindSourceFile)
        CallbackFree(this.vtbl.GetSourceFileLineOffsets)
        CallbackFree(this.vtbl.GetModuleVersionInformation)
        CallbackFree(this.vtbl.GetModuleNameString)
        CallbackFree(this.vtbl.GetConstantName)
        CallbackFree(this.vtbl.GetFieldName)
        CallbackFree(this.vtbl.GetTypeOptions)
        CallbackFree(this.vtbl.AddTypeOptions)
        CallbackFree(this.vtbl.RemoveTypeOptions)
        CallbackFree(this.vtbl.SetTypeOptions)
        CallbackFree(this.vtbl.GetNameByOffsetWide)
        CallbackFree(this.vtbl.GetOffsetByNameWide)
        CallbackFree(this.vtbl.GetNearNameByOffsetWide)
        CallbackFree(this.vtbl.GetLineByOffsetWide)
        CallbackFree(this.vtbl.GetOffsetByLineWide)
        CallbackFree(this.vtbl.GetModuleByModuleNameWide)
        CallbackFree(this.vtbl.GetSymbolModuleWide)
        CallbackFree(this.vtbl.GetTypeNameWide)
        CallbackFree(this.vtbl.GetTypeIdWide)
        CallbackFree(this.vtbl.GetFieldOffsetWide)
        CallbackFree(this.vtbl.GetSymbolTypeIdWide)
        CallbackFree(this.vtbl.GetScopeSymbolGroup2)
        CallbackFree(this.vtbl.CreateSymbolGroup2)
        CallbackFree(this.vtbl.StartSymbolMatchWide)
        CallbackFree(this.vtbl.GetNextSymbolMatchWide)
        CallbackFree(this.vtbl.ReloadWide)
        CallbackFree(this.vtbl.GetSymbolPathWide)
        CallbackFree(this.vtbl.SetSymbolPathWide)
        CallbackFree(this.vtbl.AppendSymbolPathWide)
        CallbackFree(this.vtbl.GetImagePathWide)
        CallbackFree(this.vtbl.SetImagePathWide)
        CallbackFree(this.vtbl.AppendImagePathWide)
        CallbackFree(this.vtbl.GetSourcePathWide)
        CallbackFree(this.vtbl.GetSourcePathElementWide)
        CallbackFree(this.vtbl.SetSourcePathWide)
        CallbackFree(this.vtbl.AppendSourcePathWide)
        CallbackFree(this.vtbl.FindSourceFileWide)
        CallbackFree(this.vtbl.GetSourceFileLineOffsetsWide)
        CallbackFree(this.vtbl.GetModuleVersionInformationWide)
        CallbackFree(this.vtbl.GetModuleNameStringWide)
        CallbackFree(this.vtbl.GetConstantNameWide)
        CallbackFree(this.vtbl.GetFieldNameWide)
        CallbackFree(this.vtbl.IsManagedModule)
        CallbackFree(this.vtbl.GetModuleByModuleName2)
        CallbackFree(this.vtbl.GetModuleByModuleName2Wide)
        CallbackFree(this.vtbl.GetModuleByOffset2)
        CallbackFree(this.vtbl.AddSyntheticModule)
        CallbackFree(this.vtbl.AddSyntheticModuleWide)
        CallbackFree(this.vtbl.RemoveSyntheticModule)
        CallbackFree(this.vtbl.GetCurrentScopeFrameIndex)
        CallbackFree(this.vtbl.SetScopeFrameByIndex)
        CallbackFree(this.vtbl.SetScopeFromJitDebugInfo)
        CallbackFree(this.vtbl.SetScopeFromStoredEvent)
        CallbackFree(this.vtbl.OutputSymbolByOffset)
        CallbackFree(this.vtbl.GetFunctionEntryByOffset)
        CallbackFree(this.vtbl.GetFieldTypeAndOffset)
        CallbackFree(this.vtbl.GetFieldTypeAndOffsetWide)
        CallbackFree(this.vtbl.AddSyntheticSymbol)
        CallbackFree(this.vtbl.AddSyntheticSymbolWide)
        CallbackFree(this.vtbl.RemoveSyntheticSymbol)
        CallbackFree(this.vtbl.GetSymbolEntriesByOffset)
        CallbackFree(this.vtbl.GetSymbolEntriesByName)
        CallbackFree(this.vtbl.GetSymbolEntriesByNameWide)
        CallbackFree(this.vtbl.GetSymbolEntryByToken)
        CallbackFree(this.vtbl.GetSymbolEntryInformation)
        CallbackFree(this.vtbl.GetSymbolEntryString)
        CallbackFree(this.vtbl.GetSymbolEntryStringWide)
        CallbackFree(this.vtbl.GetSymbolEntryOffsetRegions)
        CallbackFree(this.vtbl.GetSymbolEntryBySymbolEntry)
        CallbackFree(this.vtbl.GetSourceEntriesByOffset)
        CallbackFree(this.vtbl.GetSourceEntriesByLine)
        CallbackFree(this.vtbl.GetSourceEntriesByLineWide)
        CallbackFree(this.vtbl.GetSourceEntryString)
        CallbackFree(this.vtbl.GetSourceEntryStringWide)
        CallbackFree(this.vtbl.GetSourceEntryOffsetRegions)
        CallbackFree(this.vtbl.GetSourceEntryBySourceEntry)
        CallbackFree(this.vtbl.GetScopeEx)
        CallbackFree(this.vtbl.SetScopeEx)
        CallbackFree(this.vtbl.GetNameByInlineContext)
        CallbackFree(this.vtbl.GetNameByInlineContextWide)
        CallbackFree(this.vtbl.GetLineByInlineContext)
        CallbackFree(this.vtbl.GetLineByInlineContextWide)
        CallbackFree(this.vtbl.OutputSymbolByInlineContext)
    }
}
