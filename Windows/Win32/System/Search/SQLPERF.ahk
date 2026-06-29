#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct SQLPERF {
    #StructPack 8

    TimerResolution : UInt32

    SQLidu : UInt32

    SQLiduRows : UInt32

    SQLSelects : UInt32

    SQLSelectRows : UInt32

    Transactions : UInt32

    SQLPrepares : UInt32

    ExecDirects : UInt32

    SQLExecutes : UInt32

    CursorOpens : UInt32

    CursorSize : UInt32

    CursorUsed : UInt32

    PercentCursorUsed : Float64

    AvgFetchTime : Float64

    AvgCursorSize : Float64

    AvgCursorUsed : Float64

    SQLFetchTime : UInt32

    SQLFetchCount : UInt32

    CurrentStmtCount : UInt32

    MaxOpenStmt : UInt32

    SumOpenStmt : UInt32

    CurrentConnectionCount : UInt32

    MaxConnectionsOpened : UInt32

    SumConnectionsOpened : UInt32

    SumConnectiontime : UInt32

    AvgTimeOpened : Float64

    ServerRndTrips : UInt32

    BuffersSent : UInt32

    BuffersRec : UInt32

    BytesSent : UInt32

    BytesRec : UInt32

    msExecutionTime : UInt32

    msNetWorkServerTime : UInt32

}
